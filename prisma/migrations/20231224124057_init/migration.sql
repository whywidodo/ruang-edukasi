-- CreateTable
CREATE TABLE "coursetype" (
    "id" SERIAL NOT NULL,
    "type_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "coursetype_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coursecategory" (
    "id" SERIAL NOT NULL,
    "category_name" TEXT NOT NULL,
    "image_url" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "coursecategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courselevel" (
    "id" SERIAL NOT NULL,
    "level_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "courselevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "admin" (
    "id" SERIAL NOT NULL,
    "full_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "image_url" TEXT,
    "phone_number" TEXT,
    "city" TEXT,
    "country" TEXT,
    "email_token" TEXT,
    "password_token" TEXT,
    "otp_code" TEXT,
    "otp_expiration" TIMESTAMP(3),
    "status" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course" (
    "id" SERIAL NOT NULL,
    "instructor_name" TEXT NOT NULL,
    "course_name" TEXT NOT NULL,
    "course_description" TEXT,
    "image_url" TEXT,
    "price" BIGINT,
    "rating" DOUBLE PRECISION,
    "telegram_link" TEXT,
    "whatsapp_link" TEXT,
    "student_count" INTEGER,
    "video_count" INTEGER,
    "reading_count" INTEGER,
    "content_count" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_type_id" INTEGER,
    "course_category_id" INTEGER,
    "course_level_id" INTEGER,
    "admin_id" INTEGER,

    CONSTRAINT "course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coursecontent" (
    "id" SERIAL NOT NULL,
    "content_title" TEXT,
    "video_link" TEXT,
    "reading_link" TEXT,
    "status" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,

    CONSTRAINT "coursecontent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coursetarget" (
    "id" SERIAL NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,

    CONSTRAINT "coursetarget_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courseskill" (
    "id" SERIAL NOT NULL,
    "skill_name" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,

    CONSTRAINT "courseskill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coursereview" (
    "id" SERIAL NOT NULL,
    "review" TEXT,
    "rating" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,
    "user_id" INTEGER,

    CONSTRAINT "coursereview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coursecoupon" (
    "id" SERIAL NOT NULL,
    "coupon_name" TEXT,
    "coupon_code" TEXT,
    "discount_percent" TEXT,
    "valid_until" TIMESTAMP(3),
    "status" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,

    CONSTRAINT "coursecoupon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "full_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "image_url" TEXT,
    "phone_number" TEXT,
    "city" TEXT,
    "country" TEXT,
    "email_token" TEXT,
    "password_token" TEXT,
    "otp_code" TEXT,
    "otp_expiration" TIMESTAMP(3),
    "status" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order" (
    "id" SERIAL NOT NULL,
    "order_trx" TEXT,
    "total_price" BIGINT NOT NULL,
    "order_date" TIMESTAMP(3),
    "status" TEXT,
    "account_number" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,
    "course_coupon_id" INTEGER,
    "user_id" INTEGER,

    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usercoursecontent" (
    "id" SERIAL NOT NULL,
    "course_name" TEXT,
    "course_count" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER,
    "user_id" INTEGER,

    CONSTRAINT "usercoursecontent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courseppn" (
    "id" SERIAL NOT NULL,
    "ppn" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "courseppn_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usercoursecontentprogress" (
    "id" SERIAL NOT NULL,
    "course_name" TEXT,
    "status" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER,
    "courseId" INTEGER,
    "courseContentId" INTEGER,

    CONSTRAINT "usercoursecontentprogress_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "order_order_trx_key" ON "order"("order_trx");

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_course_type_id_fkey" FOREIGN KEY ("course_type_id") REFERENCES "coursetype"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_course_category_id_fkey" FOREIGN KEY ("course_category_id") REFERENCES "coursecategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_course_level_id_fkey" FOREIGN KEY ("course_level_id") REFERENCES "courselevel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coursecontent" ADD CONSTRAINT "coursecontent_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coursetarget" ADD CONSTRAINT "coursetarget_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courseskill" ADD CONSTRAINT "courseskill_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coursereview" ADD CONSTRAINT "coursereview_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coursereview" ADD CONSTRAINT "coursereview_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coursecoupon" ADD CONSTRAINT "coursecoupon_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_course_coupon_id_fkey" FOREIGN KEY ("course_coupon_id") REFERENCES "coursecoupon"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercoursecontent" ADD CONSTRAINT "usercoursecontent_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercoursecontent" ADD CONSTRAINT "usercoursecontent_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercoursecontentprogress" ADD CONSTRAINT "usercoursecontentprogress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercoursecontentprogress" ADD CONSTRAINT "usercoursecontentprogress_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "course"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usercoursecontentprogress" ADD CONSTRAINT "usercoursecontentprogress_courseContentId_fkey" FOREIGN KEY ("courseContentId") REFERENCES "coursecontent"("id") ON DELETE SET NULL ON UPDATE CASCADE;
