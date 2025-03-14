/*
 Navicat Premium Dump SQL

 Source Server         : 本地
 Source Server Type    : PostgreSQL
 Source Server Version : 160003 (160003)
 Source Host           : localhost:5432
 Source Catalog        : ai_assistant_db
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160003 (160003)
 File Encoding         : 65001

 Date: 12/11/2024 19:53:56
*/


-- ----------------------------
-- Sequence structure for lev_wx_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."lev_wx_user_id_seq";
CREATE SEQUENCE "public"."lev_wx_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_category_category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_category_category_id_seq";
CREATE SEQUENCE "public"."t_category_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_tag_tag_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_tag_tag_id_seq";
CREATE SEQUENCE "public"."t_tag_tag_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_category";
CREATE TABLE "public"."t_category" (
  "category_id" int4 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "category_name" varchar(255) COLLATE "pg_catalog"."default",
  "parent_id" int4,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."t_category"."category_id" IS '分类ID';
COMMENT ON COLUMN "public"."t_category"."category_name" IS '分类名称';
COMMENT ON COLUMN "public"."t_category"."parent_id" IS '父类ID';
COMMENT ON COLUMN "public"."t_category"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_category"."update_time" IS '更新时间';

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_course";
CREATE TABLE "public"."t_course" (
  "course_id" int8 NOT NULL,
  "course_name" varchar(255) COLLATE "pg_catalog"."default",
  "course_category" varchar(255) COLLATE "pg_catalog"."default",
  "course_tag" text COLLATE "pg_catalog"."default",
  "course_teacher" varchar(255) COLLATE "pg_catalog"."default",
  "public_state" varchar(255) COLLATE "pg_catalog"."default",
  "course_blurb" varchar(255) COLLATE "pg_catalog"."default",
  "course_url" varchar(255) COLLATE "pg_catalog"."default",
  "course_covers" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."t_course"."course_id" IS '课程ID';
COMMENT ON COLUMN "public"."t_course"."course_name" IS '课程名称';
COMMENT ON COLUMN "public"."t_course"."course_category" IS '课程分类';
COMMENT ON COLUMN "public"."t_course"."course_tag" IS '课程标签';
COMMENT ON COLUMN "public"."t_course"."course_teacher" IS '课程讲师';
COMMENT ON COLUMN "public"."t_course"."public_state" IS '公开状态';
COMMENT ON COLUMN "public"."t_course"."course_blurb" IS '课程简介';
COMMENT ON COLUMN "public"."t_course"."course_url" IS '课程存放路径';
COMMENT ON COLUMN "public"."t_course"."course_covers" IS '课程封面路径';
COMMENT ON COLUMN "public"."t_course"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_course"."update_time" IS '修改时间';

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_tag";
CREATE TABLE "public"."t_tag" (
  "tag_id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "tag_name" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."t_tag"."tag_id" IS '标签ID';
COMMENT ON COLUMN "public"."t_tag"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."t_tag"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_tag"."update_time" IS '修改时间';

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_user";
CREATE TABLE "public"."t_user" (
  "user_id" int8 NOT NULL,
  "mobile" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "role" int4,
  "educate_stage" varchar COLLATE "pg_catalog"."default",
  "nickname" varchar COLLATE "pg_catalog"."default",
  "real_name" varchar COLLATE "pg_catalog"."default",
  "license_type" varchar COLLATE "pg_catalog"."default",
  "license_number" varchar COLLATE "pg_catalog"."default",
  "school" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."t_user"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."t_user"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."t_user"."password" IS '密码';
COMMENT ON COLUMN "public"."t_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_user"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."t_user"."role" IS '角色';
COMMENT ON COLUMN "public"."t_user"."educate_stage" IS '教育阶段';
COMMENT ON COLUMN "public"."t_user"."nickname" IS '昵称';
COMMENT ON COLUMN "public"."t_user"."real_name" IS '真实姓名';
COMMENT ON COLUMN "public"."t_user"."license_type" IS '证件类型';
COMMENT ON COLUMN "public"."t_user"."license_number" IS '证件号码';
COMMENT ON COLUMN "public"."t_user"."school" IS '学校';

-- ----------------------------
-- Table structure for t_wx_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_wx_user";
CREATE TABLE "public"."t_wx_user" (
  "id" int8 NOT NULL DEFAULT nextval('lev_wx_user_id_seq'::regclass),
  "openid" varchar(28) COLLATE "pg_catalog"."default",
  "nickname" varchar(100) COLLATE "pg_catalog"."default",
  "avatar_url" varchar(2000) COLLATE "pg_catalog"."default",
  "gender" int2,
  "country" varchar(100) COLLATE "pg_catalog"."default",
  "province" varchar(100) COLLATE "pg_catalog"."default",
  "city" varchar(100) COLLATE "pg_catalog"."default",
  "language" varchar(100) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6),
  "mobile" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."t_wx_user"."openid" IS '小程序用户的openid';
COMMENT ON COLUMN "public"."t_wx_user"."nickname" IS '用户昵称';
COMMENT ON COLUMN "public"."t_wx_user"."avatar_url" IS '用户头像';
COMMENT ON COLUMN "public"."t_wx_user"."gender" IS '性别 0-男、1-女';
COMMENT ON COLUMN "public"."t_wx_user"."country" IS '所在国家';
COMMENT ON COLUMN "public"."t_wx_user"."province" IS '省份';
COMMENT ON COLUMN "public"."t_wx_user"."city" IS '城市';
COMMENT ON COLUMN "public"."t_wx_user"."language" IS '语种';
COMMENT ON COLUMN "public"."t_wx_user"."create_time" IS '创建/注册时间';
COMMENT ON COLUMN "public"."t_wx_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."t_wx_user"."mobile" IS '手机号码';
COMMENT ON TABLE "public"."t_wx_user" IS '用户信息表';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."lev_wx_user_id_seq"
OWNED BY "public"."t_wx_user"."id";
SELECT setval('"public"."lev_wx_user_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_category_category_id_seq"
OWNED BY "public"."t_category"."category_id";
SELECT setval('"public"."t_category_category_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_tag_tag_id_seq"
OWNED BY "public"."t_tag"."tag_id";
SELECT setval('"public"."t_tag_tag_id_seq"', 41, true);

-- ----------------------------
-- Primary Key structure for table t_category
-- ----------------------------
ALTER TABLE "public"."t_category" ADD CONSTRAINT "t_category_pkey" PRIMARY KEY ("category_id");

-- ----------------------------
-- Primary Key structure for table t_course
-- ----------------------------
ALTER TABLE "public"."t_course" ADD CONSTRAINT "t_course_pkey" PRIMARY KEY ("course_id");

-- ----------------------------
-- Primary Key structure for table t_tag
-- ----------------------------
ALTER TABLE "public"."t_tag" ADD CONSTRAINT "t_tag_pkey" PRIMARY KEY ("tag_id");

-- ----------------------------
-- Primary Key structure for table t_user
-- ----------------------------
ALTER TABLE "public"."t_user" ADD CONSTRAINT "t_user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Checks structure for table t_wx_user
-- ----------------------------
ALTER TABLE "public"."t_wx_user" ADD CONSTRAINT "lev_wx_user_gender_check" CHECK (gender = ANY (ARRAY[0, 1]));

-- ----------------------------
-- Primary Key structure for table t_wx_user
-- ----------------------------
ALTER TABLE "public"."t_wx_user" ADD CONSTRAINT "lev_wx_user_pkey" PRIMARY KEY ("id");
