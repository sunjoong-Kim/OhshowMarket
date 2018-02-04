-- 회원
CREATE TABLE `ohshow_user` (
	`user_id`      VARCHAR(50)  NOT NULL COMMENT '회원 아이디', -- 회원 아이디
	`user_name`    VARCHAR(50)  NOT NULL COMMENT '회원 이름', -- 회원 이름
	`user_pw`      VARCHAR(50)  NOT NULL COMMENT '회원 비밀번호', -- 회원 비밀번호
	`user_pnum`    VARCHAR(50)  NOT NULL COMMENT '회원 전화번호', -- 회원 전화번호
	`user_email`   VARCHAR(250) NOT NULL COMMENT '회원 이메일 주소', -- 회원 이메일 주소
	`user_address` VARCHAR(250) NOT NULL COMMENT '회원 집 주소', -- 회원 집 주소
	`user_birth`   DATE         NOT NULL COMMENT '회원 생년 월일', -- 회원 생년 월일
	`user_created` DATE         NOT NULL COMMENT '회원가입 일', -- 회원가입 일
	`user_point`   INT          NULL     COMMENT '회원 마일리지', -- 회원 마일리지
	`user_level`   VARCHAR(50)  NULL     COMMENT '회원 등급' -- 회원 등급
)
COMMENT '회원';

-- 회원
ALTER TABLE `ohshow_user`
	ADD CONSTRAINT `PK_ohshow_user` -- 회원 기본키
		PRIMARY KEY (
			`user_id` -- 회원 아이디
		);

-- 관리자
CREATE TABLE `ohshow_admin` (
	`admin_id`    VARCHAR(50) NOT NULL COMMENT '관리자 아이디', -- 관리자 아이디
	`admin_name`  VARCHAR(50) NOT NULL COMMENT '관리자 이름', -- 관리자 이름
	`admin_pw`    VARCHAR(50) NOT NULL COMMENT '관리자 비밀번호', -- 관리자 비밀번호
	`admin_pnum`  VARCHAR(50) NULL     COMMENT '관리자 전화번호', -- 관리자 전화번호
	`admin_level` VARCHAR(50) NULL     COMMENT '관리자 등급' -- 관리자 등급
)
COMMENT '관리자';

-- 관리자
ALTER TABLE `ohshow_admin`
	ADD CONSTRAINT `PK_ohshow_admin` -- 관리자 기본키
		PRIMARY KEY (
			`admin_id` -- 관리자 아이디
		);

-- 제조사
CREATE TABLE `ohshow_maker` (
	`maker_id`      INT          NOT NULL COMMENT '제조사 아이디', -- 제조사 아이디
	`maker_pw`      VARCHAR(50)  NULL     COMMENT '제조사 비밀번호', -- 제조사 비밀번호
	`maker_name`    VARCHAR(50)  NULL     COMMENT '제조사 명', -- 제조사 명
	`maker_pnum`    VARCHAR(50)  NULL     COMMENT '제조사 전화번호', -- 제조사 전화번호
	`maker_address` VARCHAR(250) NULL     COMMENT '제조사 주소', -- 제조사 주소
	`maker_bid`     VARCHAR(50)  NULL     COMMENT '제조사 사업자 번호', -- 제조사 사업자 번호
	`makerbank_id`  INT          NULL     COMMENT '은행 번호' -- 은행 번호
)
COMMENT '제조사';

-- 제조사
ALTER TABLE `ohshow_maker`
	ADD CONSTRAINT `PK_ohshow_maker` -- 제조사 기본키
		PRIMARY KEY (
			`maker_id` -- 제조사 아이디
		);

-- 제조사 은행 정보
CREATE TABLE `ohshow_makerbank` (
	`makerbank_id`      INT          NOT NULL COMMENT '은행 번호', -- 은행 번호
	`makerbank_name`    VARCHAR(50)  NOT NULL COMMENT '은행 명', -- 은행 명
	`makerbank_account` VARCHAR(100) NOT NULL COMMENT '은형 계좌 번호', -- 은형 계좌 번호
	`makerbank_deposit` INT          NOT NULL COMMENT '은행 예금주' -- 은행 예금주
)
COMMENT '제조사 은행 정보';

-- 제조사 은행 정보
ALTER TABLE `ohshow_makerbank`
	ADD CONSTRAINT `PK_ohshow_makerbank` -- 제조사 은행 정보 기본키
		PRIMARY KEY (
			`makerbank_id` -- 은행 번호
		);

ALTER TABLE `ohshow_makerbank`
	MODIFY COLUMN `makerbank_id` INT NOT NULL AUTO_INCREMENT COMMENT '은행 번호';

-- 판매 게시판
CREATE TABLE `ohshow_sale_board` (
	`sb_id`         INT           NOT NULL COMMENT '판매 게시판 번호', -- 판매 게시판 번호
	`sale_category` VARCHAR(128)  NULL     COMMENT '제품 분류', -- 제품 분류
	`sale_title`    VARCHAR(512)  NULL     COMMENT '판매 게시판 제목', -- 판매 게시판 제목
	`sale_contents` VARCHAR(1024) NULL     COMMENT '판매 게시판 내용', -- 판매 게시판 내용
	`sale_created`  DATE          NULL     COMMENT '판매 게시판 등록일', -- 판매 게시판 등록일
	`sale_view`     INT           NULL     COMMENT '판매 게시판 조회수', -- 판매 게시판 조회수
	`maker_id`      INT           NULL     COMMENT '제조사 아이디', -- 제조사 아이디
	`file_id`       INT           NULL     COMMENT '파일 번호' -- 파일 번호
)
COMMENT '판매 게시판';

-- 판매 게시판
ALTER TABLE `ohshow_sale_board`
	ADD CONSTRAINT `PK_ohshow_sale_board` -- 판매 게시판 기본키
		PRIMARY KEY (
			`sb_id` -- 판매 게시판 번호
		);

ALTER TABLE `ohshow_sale_board`
	MODIFY COLUMN `sb_id` INT NOT NULL AUTO_INCREMENT COMMENT '판매 게시판 번호';

-- 판매 제품 정보
CREATE TABLE `ohshow_product` (
	`product_id`       INT          NOT NULL COMMENT '제품 정보 번호', -- 제품 정보 번호
	`product_name`     VARCHAR(150) NULL     COMMENT '제품 명', -- 제품 명
	`product_price`    INT          NULL     COMMENT '제품 가격', -- 제품 가격
	`product_quantity` INT          NULL     COMMENT '제품 수량', -- 제품 수량
	`product_delivery` INT          NULL     COMMENT '제품 배송비', -- 제품 배송비
	`sb_id`            INT          NULL     COMMENT '판매 게시판 번호' -- 판매 게시판 번호
)
COMMENT '판매 제품 정보';

-- 판매 제품 정보
ALTER TABLE `ohshow_product`
	ADD CONSTRAINT `PK_ohshow_product` -- 판매 제품 정보 기본키
		PRIMARY KEY (
			`product_id` -- 제품 정보 번호
		);

ALTER TABLE `ohshow_product`
	MODIFY COLUMN `product_id` INT NOT NULL AUTO_INCREMENT COMMENT '제품 정보 번호';

-- 업로드 파일
CREATE TABLE `ohshow_file` (
	`file_id`     INT          NOT NULL COMMENT '파일 번호', -- 파일 번호
	`file_path`   VARCHAR(250) NULL     COMMENT '파일 path', -- 파일 path
	`file_origin` VARCHAR(50)  NULL     COMMENT '오리지날 파일명', -- 오리지날 파일명
	`file_alter`  VARCHAR(50)  NULL     COMMENT '변형된 파일명' -- 변형된 파일명
)
COMMENT '업로드 파일';

-- 업로드 파일
ALTER TABLE `ohshow_file`
	ADD CONSTRAINT `PK_ohshow_file` -- 업로드 파일 기본키
		PRIMARY KEY (
			`file_id` -- 파일 번호
		);

ALTER TABLE `ohshow_file`
	MODIFY COLUMN `file_id` INT NOT NULL AUTO_INCREMENT COMMENT '파일 번호';

-- 제품 후기
CREATE TABLE `ohshow_after` (
	`after_id`       INT          NOT NULL COMMENT '제품 후기 번호', -- 제품 후기 번호
	`after_title`    VARCHAR(150) NOT NULL COMMENT '후기 제목', -- 후기 제목
	`after_contents` VARCHAR(500) NULL     COMMENT '후기 내용', -- 후기 내용
	`after_score`    REAL         NULL     COMMENT '후기 평점', -- 후기 평점
	`sb_id`          INT          NULL     COMMENT '판매 게시판 번호' -- 판매 게시판 번호
)
COMMENT '제품 후기';

-- 제품 후기
ALTER TABLE `ohshow_after`
	ADD CONSTRAINT `PK_ohshow_after` -- 제품 후기 기본키
		PRIMARY KEY (
			`after_id` -- 제품 후기 번호
		);

ALTER TABLE `ohshow_after`
	MODIFY COLUMN `after_id` INT NOT NULL AUTO_INCREMENT COMMENT '제품 후기 번호';

-- 제품 문의(Q&A)
CREATE TABLE `ohshow_qaboard` (
	`qaboard_id`       INT          NOT NULL COMMENT '문의 질문 번호', -- 문의 질문 번호
	`qaboard_type`     VARCHAR(50)  NULL     COMMENT '문의 유형', -- 문의 유형
	`qaboard_title`    VARCHAR(100) NULL     COMMENT '문의 제목', -- 문의 제목
	`qaboard_contents` VARCHAR(500) NULL     COMMENT '문의 내용', -- 문의 내용
	`user_id`          VARCHAR(50)  NULL     COMMENT '회원 아이디', -- 회원 아이디
	`sb_id`            INT          NULL     COMMENT '판매 게시판 번호' -- 판매 게시판 번호
)
COMMENT '제품 문의(Q&A)';

-- 제품 문의(Q&A)
ALTER TABLE `ohshow_qaboard`
	ADD CONSTRAINT `PK_ohshow_qaboard` -- 제품 문의(Q&A) 기본키
		PRIMARY KEY (
			`qaboard_id` -- 문의 질문 번호
		);

ALTER TABLE `ohshow_qaboard`
	MODIFY COLUMN `qaboard_id` INT NOT NULL AUTO_INCREMENT COMMENT '문의 질문 번호';

-- 주문
CREATE TABLE `ohshow_order` (
	`order_id`      INT          NOT NULL COMMENT '주문 번호', -- 주문 번호
	`oder_btype`    VARCHAR(50)  NOT NULL COMMENT '결제 수단', -- 결제 수단
	`order_date`    DATE         NOT NULL COMMENT '주문 일자', -- 주문 일자
	`order_req`     VARCHAR(150) NULL     COMMENT '주문 요청 사항', -- 주문 요청 사항
	`order_address` VARCHAR(250) NOT NULL COMMENT '주문 배송지', -- 주문 배송지
	`order_status`  VARCHAR(50)  NULL     COMMENT '주문 결제 상태', -- 주문 결제 상태
	`user_id`       VARCHAR(50)  NOT NULL COMMENT '회원 아이디' -- 회원 아이디
)
COMMENT '주문';

-- 주문
ALTER TABLE `ohshow_order`
	ADD CONSTRAINT `PK_ohshow_order` -- 주문 기본키
		PRIMARY KEY (
			`order_id` -- 주문 번호
		);

ALTER TABLE `ohshow_order`
	MODIFY COLUMN `order_id` INT NOT NULL AUTO_INCREMENT COMMENT '주문 번호';

-- 주문 상세 내역
CREATE TABLE `ohshow_oreder_detail` (
	`od_id`      INT NOT NULL COMMENT '주문 상세 내역 번호', -- 주문 상세 내역 번호
	`order_id`   INT NULL     COMMENT '주문 번호', -- 주문 번호
	`product_id` INT NULL     COMMENT '제품 정보 번호' -- 제품 정보 번호
)
COMMENT '주문 상세 내역';

-- 주문 상세 내역
ALTER TABLE `ohshow_oreder_detail`
	ADD CONSTRAINT `PK_ohshow_oreder_detail` -- 주문 상세 내역 기본키
		PRIMARY KEY (
			`od_id` -- 주문 상세 내역 번호
		);

ALTER TABLE `ohshow_oreder_detail`
	MODIFY COLUMN `od_id` INT NOT NULL AUTO_INCREMENT COMMENT '주문 상세 내역 번호';

-- 택배
CREATE TABLE `ohshow_delivery` (
	`delivery_id`      VARCHAR(50)  NOT NULL COMMENT '택배 사업자 번호', -- 택배 사업자 번호
	`delivery_company` VARCHAR(50)  NULL     COMMENT '택배 업체명', -- 택배 업체명
	`delivery_pnum`    VARCHAR(50)  NULL     COMMENT '택배사 전화번호', -- 택배사 전화번호
	`delivert_address` VARCHAR(250) NULL     COMMENT '택배사 주소', -- 택배사 주소
	`admin_id`         VARCHAR(50)  NOT NULL COMMENT '관리자 아이디' -- 관리자 아이디
)
COMMENT '택배';

-- 택배
ALTER TABLE `ohshow_delivery`
	ADD CONSTRAINT `PK_ohshow_delivery` -- 택배 기본키
		PRIMARY KEY (
			`delivery_id` -- 택배 사업자 번호
		);

-- 제조사 선정 택배
CREATE TABLE `ohshow_maker_delivery` (
	`md_id`       INT         NOT NULL COMMENT '제조사 택배 번호', -- 제조사 택배 번호
	`maker_id`    INT         NULL     COMMENT '제조사 아이디', -- 제조사 아이디
	`delivery_id` VARCHAR(50) NULL     COMMENT '택배 사업자 번호' -- 택배 사업자 번호
)
COMMENT '제조사 선정 택배';

-- 제조사 선정 택배
ALTER TABLE `ohshow_maker_delivery`
	ADD CONSTRAINT `PK_ohshow_maker_delivery` -- 제조사 선정 택배 기본키
		PRIMARY KEY (
			`md_id` -- 제조사 택배 번호
		);

ALTER TABLE `ohshow_maker_delivery`
	MODIFY COLUMN `md_id` INT NOT NULL AUTO_INCREMENT COMMENT '제조사 택배 번호';

-- 주문 택배 정보
CREATE TABLE `ohshow_order_delivery` (
	`od_id`     INT         NOT NULL COMMENT '주문 택배 번호', -- 주문 택배 번호
	`od_status` VARCHAR(50) NULL     COMMENT '주문 배송 상태', -- 주문 배송 상태
	`order_id`  INT         NOT NULL COMMENT '주문 번호', -- 주문 번호
	`md_id`     INT         NOT NULL COMMENT '제조사 택배 번호' -- 제조사 택배 번호
)
COMMENT '주문 택배 정보';

-- 주문 택배 정보
ALTER TABLE `ohshow_order_delivery`
	ADD CONSTRAINT `PK_ohshow_order_delivery` -- 주문 택배 정보 기본키
		PRIMARY KEY (
			`od_id` -- 주문 택배 번호
		);

ALTER TABLE `ohshow_order_delivery`
	MODIFY COLUMN `od_id` INT NOT NULL AUTO_INCREMENT COMMENT '주문 택배 번호';

-- 제품 답변(Q&A)
CREATE TABLE `ohshow_answer` (
	`answer_id`       INT          NOT NULL COMMENT '제품 답변 번호', -- 제품 답변 번호
	`answer_contents` VARCHAR(500) NULL     COMMENT '답변 내용', -- 답변 내용
	`maker_id`        INT          NULL     COMMENT '제조사 아이디', -- 제조사 아이디
	`qaboard_id`      INT          NULL     COMMENT '문의 질문 번호' -- 문의 질문 번호
)
COMMENT '제품 답변(Q&A)';

-- 제품 답변(Q&A)
ALTER TABLE `ohshow_answer`
	ADD CONSTRAINT `PK_ohshow_answer` -- 제품 답변(Q&A) 기본키
		PRIMARY KEY (
			`answer_id` -- 제품 답변 번호
		);

ALTER TABLE `ohshow_answer`
	MODIFY COLUMN `answer_id` INT NOT NULL AUTO_INCREMENT COMMENT '제품 답변 번호';

-- 장바구니
CREATE TABLE `ohshow_basket` (
	`basket_id`      INT         NOT NULL COMMENT '장바구니 번호', -- 장바구니 번호
	`basket_created` DATE        NULL     COMMENT '제품 등록일', -- 제품 등록일
	`user_id`        VARCHAR(50) NULL     COMMENT '회원 아이디', -- 회원 아이디
	`bd_id`          INT         NULL     COMMENT '장바구니 상세 내역 번호' -- 장바구니 상세 내역 번호
)
COMMENT '장바구니';

-- 장바구니
ALTER TABLE `ohshow_basket`
	ADD CONSTRAINT `PK_ohshow_basket` -- 장바구니 기본키
		PRIMARY KEY (
			`basket_id` -- 장바구니 번호
		);

ALTER TABLE `ohshow_basket`
	MODIFY COLUMN `basket_id` INT NOT NULL AUTO_INCREMENT COMMENT '장바구니 번호';

-- 장바구니 상세 내역
CREATE TABLE `ohshow_basket_detail` (
	`bd_id`      INT NOT NULL COMMENT '장바구니 상세 내역 번호', -- 장바구니 상세 내역 번호
	`product_id` INT NULL     COMMENT '제품 정보 번호' -- 제품 정보 번호
)
COMMENT '장바구니 상세 내역';

-- 장바구니 상세 내역
ALTER TABLE `ohshow_basket_detail`
	ADD CONSTRAINT `PK_ohshow_basket_detail` -- 장바구니 상세 내역 기본키
		PRIMARY KEY (
			`bd_id` -- 장바구니 상세 내역 번호
		);

ALTER TABLE `ohshow_basket_detail`
	MODIFY COLUMN `bd_id` INT NOT NULL AUTO_INCREMENT COMMENT '장바구니 상세 내역 번호';

-- 공지사항
CREATE TABLE `ohshow_notice` (
	`notice_id`       INT          NOT NULL COMMENT '공지사항 번호', -- 공지사항 번호
	`notice_title`    VARCHAR(50)  NULL     COMMENT '공지 제목', -- 공지 제목
	`notice_contents` VARCHAR(512) NULL     COMMENT '공지 내용', -- 공지 내용
	`notice_date`     DATE         NULL     COMMENT '공지 일자' -- 공지 일자
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE `ohshow_notice`
	ADD CONSTRAINT `PK_ohshow_notice` -- 공지사항 기본키
		PRIMARY KEY (
			`notice_id` -- 공지사항 번호
		);

ALTER TABLE `ohshow_notice`
	MODIFY COLUMN `notice_id` INT NOT NULL AUTO_INCREMENT COMMENT '공지사항 번호';

-- 제조사
ALTER TABLE `ohshow_maker`
	ADD CONSTRAINT `FK_ohshow_makerbank_TO_ohshow_maker` -- 제조사 은행 정보 -> 제조사
		FOREIGN KEY (
			`makerbank_id` -- 은행 번호
		)
		REFERENCES `ohshow_makerbank` ( -- 제조사 은행 정보
			`makerbank_id` -- 은행 번호
		);

-- 판매 게시판
ALTER TABLE `ohshow_sale_board`
	ADD CONSTRAINT `FK_ohshow_maker_TO_ohshow_sale_board` -- 제조사 -> 판매 게시판
		FOREIGN KEY (
			`maker_id` -- 제조사 아이디
		)
		REFERENCES `ohshow_maker` ( -- 제조사
			`maker_id` -- 제조사 아이디
		);

-- 판매 게시판
ALTER TABLE `ohshow_sale_board`
	ADD CONSTRAINT `FK_ohshow_file_TO_ohshow_sale_board` -- 업로드 파일 -> 판매 게시판
		FOREIGN KEY (
			`file_id` -- 파일 번호
		)
		REFERENCES `ohshow_file` ( -- 업로드 파일
			`file_id` -- 파일 번호
		);

-- 판매 제품 정보
ALTER TABLE `ohshow_product`
	ADD CONSTRAINT `FK_ohshow_sale_board_TO_ohshow_product` -- 판매 게시판 -> 판매 제품 정보
		FOREIGN KEY (
			`sb_id` -- 판매 게시판 번호
		)
		REFERENCES `ohshow_sale_board` ( -- 판매 게시판
			`sb_id` -- 판매 게시판 번호
		);

-- 제품 후기
ALTER TABLE `ohshow_after`
	ADD CONSTRAINT `FK_ohshow_sale_board_TO_ohshow_after` -- 판매 게시판 -> 제품 후기
		FOREIGN KEY (
			`sb_id` -- 판매 게시판 번호
		)
		REFERENCES `ohshow_sale_board` ( -- 판매 게시판
			`sb_id` -- 판매 게시판 번호
		);

-- 제품 문의(Q&A)
ALTER TABLE `ohshow_qaboard`
	ADD CONSTRAINT `FK_ohshow_user_TO_ohshow_qaboard` -- 회원 -> 제품 문의(Q&A)
		FOREIGN KEY (
			`user_id` -- 회원 아이디
		)
		REFERENCES `ohshow_user` ( -- 회원
			`user_id` -- 회원 아이디
		);

-- 제품 문의(Q&A)
ALTER TABLE `ohshow_qaboard`
	ADD CONSTRAINT `FK_ohshow_sale_board_TO_ohshow_qaboard` -- 판매 게시판 -> 제품 문의(Q&A)
		FOREIGN KEY (
			`sb_id` -- 판매 게시판 번호
		)
		REFERENCES `ohshow_sale_board` ( -- 판매 게시판
			`sb_id` -- 판매 게시판 번호
		);

-- 주문
ALTER TABLE `ohshow_order`
	ADD CONSTRAINT `FK_ohshow_user_TO_ohshow_order` -- 회원 -> 주문
		FOREIGN KEY (
			`user_id` -- 회원 아이디
		)
		REFERENCES `ohshow_user` ( -- 회원
			`user_id` -- 회원 아이디
		);

-- 주문 상세 내역
ALTER TABLE `ohshow_oreder_detail`
	ADD CONSTRAINT `FK_ohshow_order_TO_ohshow_oreder_detail` -- 주문 -> 주문 상세 내역
		FOREIGN KEY (
			`order_id` -- 주문 번호
		)
		REFERENCES `ohshow_order` ( -- 주문
			`order_id` -- 주문 번호
		);

-- 주문 상세 내역
ALTER TABLE `ohshow_oreder_detail`
	ADD CONSTRAINT `FK_ohshow_product_TO_ohshow_oreder_detail` -- 판매 제품 정보 -> 주문 상세 내역
		FOREIGN KEY (
			`product_id` -- 제품 정보 번호
		)
		REFERENCES `ohshow_product` ( -- 판매 제품 정보
			`product_id` -- 제품 정보 번호
		);

-- 택배
ALTER TABLE `ohshow_delivery`
	ADD CONSTRAINT `FK_ohshow_admin_TO_ohshow_delivery` -- 관리자 -> 택배
		FOREIGN KEY (
			`admin_id` -- 관리자 아이디
		)
		REFERENCES `ohshow_admin` ( -- 관리자
			`admin_id` -- 관리자 아이디
		);

-- 제조사 선정 택배
ALTER TABLE `ohshow_maker_delivery`
	ADD CONSTRAINT `FK_ohshow_maker_TO_ohshow_maker_delivery` -- 제조사 -> 제조사 선정 택배
		FOREIGN KEY (
			`maker_id` -- 제조사 아이디
		)
		REFERENCES `ohshow_maker` ( -- 제조사
			`maker_id` -- 제조사 아이디
		);

-- 제조사 선정 택배
ALTER TABLE `ohshow_maker_delivery`
	ADD CONSTRAINT `FK_ohshow_delivery_TO_ohshow_maker_delivery` -- 택배 -> 제조사 선정 택배
		FOREIGN KEY (
			`delivery_id` -- 택배 사업자 번호
		)
		REFERENCES `ohshow_delivery` ( -- 택배
			`delivery_id` -- 택배 사업자 번호
		);

-- 주문 택배 정보
ALTER TABLE `ohshow_order_delivery`
	ADD CONSTRAINT `FK_ohshow_order_TO_ohshow_order_delivery` -- 주문 -> 주문 택배 정보
		FOREIGN KEY (
			`order_id` -- 주문 번호
		)
		REFERENCES `ohshow_order` ( -- 주문
			`order_id` -- 주문 번호
		);

-- 주문 택배 정보
ALTER TABLE `ohshow_order_delivery`
	ADD CONSTRAINT `FK_ohshow_maker_delivery_TO_ohshow_order_delivery` -- 제조사 선정 택배 -> 주문 택배 정보
		FOREIGN KEY (
			`md_id` -- 제조사 택배 번호
		)
		REFERENCES `ohshow_maker_delivery` ( -- 제조사 선정 택배
			`md_id` -- 제조사 택배 번호
		);

-- 제품 답변(Q&A)
ALTER TABLE `ohshow_answer`
	ADD CONSTRAINT `FK_ohshow_maker_TO_ohshow_answer` -- 제조사 -> 제품 답변(Q&A)
		FOREIGN KEY (
			`maker_id` -- 제조사 아이디
		)
		REFERENCES `ohshow_maker` ( -- 제조사
			`maker_id` -- 제조사 아이디
		);

-- 제품 답변(Q&A)
ALTER TABLE `ohshow_answer`
	ADD CONSTRAINT `FK_ohshow_qaboard_TO_ohshow_answer` -- 제품 문의(Q&A) -> 제품 답변(Q&A)
		FOREIGN KEY (
			`qaboard_id` -- 문의 질문 번호
		)
		REFERENCES `ohshow_qaboard` ( -- 제품 문의(Q&A)
			`qaboard_id` -- 문의 질문 번호
		);

-- 장바구니
ALTER TABLE `ohshow_basket`
	ADD CONSTRAINT `FK_ohshow_user_TO_ohshow_basket` -- 회원 -> 장바구니
		FOREIGN KEY (
			`user_id` -- 회원 아이디
		)
		REFERENCES `ohshow_user` ( -- 회원
			`user_id` -- 회원 아이디
		);

-- 장바구니
ALTER TABLE `ohshow_basket`
	ADD CONSTRAINT `FK_ohshow_basket_detail_TO_ohshow_basket` -- 장바구니 상세 내역 -> 장바구니
		FOREIGN KEY (
			`bd_id` -- 장바구니 상세 내역 번호
		)
		REFERENCES `ohshow_basket_detail` ( -- 장바구니 상세 내역
			`bd_id` -- 장바구니 상세 내역 번호
		);

-- 장바구니 상세 내역
ALTER TABLE `ohshow_basket_detail`
	ADD CONSTRAINT `FK_ohshow_product_TO_ohshow_basket_detail` -- 판매 제품 정보 -> 장바구니 상세 내역
		FOREIGN KEY (
			`product_id` -- 제품 정보 번호
		)
		REFERENCES `ohshow_product` ( -- 판매 제품 정보
			`product_id` -- 제품 정보 번호
		);