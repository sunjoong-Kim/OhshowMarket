-- ȸ��
CREATE TABLE `ohshow_user` (
	`user_id`      VARCHAR(50)  NOT NULL COMMENT 'ȸ�� ���̵�', -- ȸ�� ���̵�
	`user_name`    VARCHAR(50)  NOT NULL COMMENT 'ȸ�� �̸�', -- ȸ�� �̸�
	`user_pw`      VARCHAR(50)  NOT NULL COMMENT 'ȸ�� ��й�ȣ', -- ȸ�� ��й�ȣ
	`user_pnum`    VARCHAR(50)  NOT NULL COMMENT 'ȸ�� ��ȭ��ȣ', -- ȸ�� ��ȭ��ȣ
	`user_email`   VARCHAR(250) NOT NULL COMMENT 'ȸ�� �̸��� �ּ�', -- ȸ�� �̸��� �ּ�
	`user_address` VARCHAR(250) NOT NULL COMMENT 'ȸ�� �� �ּ�', -- ȸ�� �� �ּ�
	`user_birth`   DATE         NOT NULL COMMENT 'ȸ�� ���� ����', -- ȸ�� ���� ����
	`user_created` DATE         NOT NULL COMMENT 'ȸ������ ��', -- ȸ������ ��
	`user_point`   INT          NULL     COMMENT 'ȸ�� ���ϸ���', -- ȸ�� ���ϸ���
	`user_level`   VARCHAR(50)  NULL     COMMENT 'ȸ�� ���' -- ȸ�� ���
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE `ohshow_user`
	ADD CONSTRAINT `PK_ohshow_user` -- ȸ�� �⺻Ű
		PRIMARY KEY (
			`user_id` -- ȸ�� ���̵�
		);

-- ������
CREATE TABLE `ohshow_admin` (
	`admin_id`    VARCHAR(50) NOT NULL COMMENT '������ ���̵�', -- ������ ���̵�
	`admin_name`  VARCHAR(50) NOT NULL COMMENT '������ �̸�', -- ������ �̸�
	`admin_pw`    VARCHAR(50) NOT NULL COMMENT '������ ��й�ȣ', -- ������ ��й�ȣ
	`admin_pnum`  VARCHAR(50) NULL     COMMENT '������ ��ȭ��ȣ', -- ������ ��ȭ��ȣ
	`admin_level` VARCHAR(50) NULL     COMMENT '������ ���' -- ������ ���
)
COMMENT '������';

-- ������
ALTER TABLE `ohshow_admin`
	ADD CONSTRAINT `PK_ohshow_admin` -- ������ �⺻Ű
		PRIMARY KEY (
			`admin_id` -- ������ ���̵�
		);

-- ������
CREATE TABLE `ohshow_maker` (
	`maker_id`      INT          NOT NULL COMMENT '������ ���̵�', -- ������ ���̵�
	`maker_pw`      VARCHAR(50)  NULL     COMMENT '������ ��й�ȣ', -- ������ ��й�ȣ
	`maker_name`    VARCHAR(50)  NULL     COMMENT '������ ��', -- ������ ��
	`maker_pnum`    VARCHAR(50)  NULL     COMMENT '������ ��ȭ��ȣ', -- ������ ��ȭ��ȣ
	`maker_address` VARCHAR(250) NULL     COMMENT '������ �ּ�', -- ������ �ּ�
	`maker_bid`     VARCHAR(50)  NULL     COMMENT '������ ����� ��ȣ', -- ������ ����� ��ȣ
	`makerbank_id`  INT          NULL     COMMENT '���� ��ȣ' -- ���� ��ȣ
)
COMMENT '������';

-- ������
ALTER TABLE `ohshow_maker`
	ADD CONSTRAINT `PK_ohshow_maker` -- ������ �⺻Ű
		PRIMARY KEY (
			`maker_id` -- ������ ���̵�
		);

-- ������ ���� ����
CREATE TABLE `ohshow_makerbank` (
	`makerbank_id`      INT          NOT NULL COMMENT '���� ��ȣ', -- ���� ��ȣ
	`makerbank_name`    VARCHAR(50)  NOT NULL COMMENT '���� ��', -- ���� ��
	`makerbank_account` VARCHAR(100) NOT NULL COMMENT '���� ���� ��ȣ', -- ���� ���� ��ȣ
	`makerbank_deposit` INT          NOT NULL COMMENT '���� ������' -- ���� ������
)
COMMENT '������ ���� ����';

-- ������ ���� ����
ALTER TABLE `ohshow_makerbank`
	ADD CONSTRAINT `PK_ohshow_makerbank` -- ������ ���� ���� �⺻Ű
		PRIMARY KEY (
			`makerbank_id` -- ���� ��ȣ
		);

ALTER TABLE `ohshow_makerbank`
	MODIFY COLUMN `makerbank_id` INT NOT NULL AUTO_INCREMENT COMMENT '���� ��ȣ';

-- �Ǹ� �Խ���
CREATE TABLE `ohshow_sale_board` (
	`sb_id`         INT           NOT NULL COMMENT '�Ǹ� �Խ��� ��ȣ', -- �Ǹ� �Խ��� ��ȣ
	`sale_category` VARCHAR(128)  NULL     COMMENT '��ǰ �з�', -- ��ǰ �з�
	`sale_title`    VARCHAR(512)  NULL     COMMENT '�Ǹ� �Խ��� ����', -- �Ǹ� �Խ��� ����
	`sale_contents` VARCHAR(1024) NULL     COMMENT '�Ǹ� �Խ��� ����', -- �Ǹ� �Խ��� ����
	`sale_created`  DATE          NULL     COMMENT '�Ǹ� �Խ��� �����', -- �Ǹ� �Խ��� �����
	`sale_view`     INT           NULL     COMMENT '�Ǹ� �Խ��� ��ȸ��', -- �Ǹ� �Խ��� ��ȸ��
	`maker_id`      INT           NULL     COMMENT '������ ���̵�', -- ������ ���̵�
	`file_id`       INT           NULL     COMMENT '���� ��ȣ' -- ���� ��ȣ
)
COMMENT '�Ǹ� �Խ���';

-- �Ǹ� �Խ���
ALTER TABLE `ohshow_sale_board`
	ADD CONSTRAINT `PK_ohshow_sale_board` -- �Ǹ� �Խ��� �⺻Ű
		PRIMARY KEY (
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		);

ALTER TABLE `ohshow_sale_board`
	MODIFY COLUMN `sb_id` INT NOT NULL AUTO_INCREMENT COMMENT '�Ǹ� �Խ��� ��ȣ';

-- �Ǹ� ��ǰ ����
CREATE TABLE `ohshow_product` (
	`product_id`       INT          NOT NULL COMMENT '��ǰ ���� ��ȣ', -- ��ǰ ���� ��ȣ
	`product_name`     VARCHAR(150) NULL     COMMENT '��ǰ ��', -- ��ǰ ��
	`product_price`    INT          NULL     COMMENT '��ǰ ����', -- ��ǰ ����
	`product_quantity` INT          NULL     COMMENT '��ǰ ����', -- ��ǰ ����
	`product_delivery` INT          NULL     COMMENT '��ǰ ��ۺ�', -- ��ǰ ��ۺ�
	`sb_id`            INT          NULL     COMMENT '�Ǹ� �Խ��� ��ȣ' -- �Ǹ� �Խ��� ��ȣ
)
COMMENT '�Ǹ� ��ǰ ����';

-- �Ǹ� ��ǰ ����
ALTER TABLE `ohshow_product`
	ADD CONSTRAINT `PK_ohshow_product` -- �Ǹ� ��ǰ ���� �⺻Ű
		PRIMARY KEY (
			`product_id` -- ��ǰ ���� ��ȣ
		);

ALTER TABLE `ohshow_product`
	MODIFY COLUMN `product_id` INT NOT NULL AUTO_INCREMENT COMMENT '��ǰ ���� ��ȣ';

-- ���ε� ����
CREATE TABLE `ohshow_file` (
	`file_id`     INT          NOT NULL COMMENT '���� ��ȣ', -- ���� ��ȣ
	`file_path`   VARCHAR(250) NULL     COMMENT '���� path', -- ���� path
	`file_origin` VARCHAR(50)  NULL     COMMENT '�������� ���ϸ�', -- �������� ���ϸ�
	`file_alter`  VARCHAR(50)  NULL     COMMENT '������ ���ϸ�' -- ������ ���ϸ�
)
COMMENT '���ε� ����';

-- ���ε� ����
ALTER TABLE `ohshow_file`
	ADD CONSTRAINT `PK_ohshow_file` -- ���ε� ���� �⺻Ű
		PRIMARY KEY (
			`file_id` -- ���� ��ȣ
		);

ALTER TABLE `ohshow_file`
	MODIFY COLUMN `file_id` INT NOT NULL AUTO_INCREMENT COMMENT '���� ��ȣ';

-- ��ǰ �ı�
CREATE TABLE `ohshow_after` (
	`after_id`       INT          NOT NULL COMMENT '��ǰ �ı� ��ȣ', -- ��ǰ �ı� ��ȣ
	`after_title`    VARCHAR(150) NOT NULL COMMENT '�ı� ����', -- �ı� ����
	`after_contents` VARCHAR(500) NULL     COMMENT '�ı� ����', -- �ı� ����
	`after_score`    REAL         NULL     COMMENT '�ı� ����', -- �ı� ����
	`sb_id`          INT          NULL     COMMENT '�Ǹ� �Խ��� ��ȣ' -- �Ǹ� �Խ��� ��ȣ
)
COMMENT '��ǰ �ı�';

-- ��ǰ �ı�
ALTER TABLE `ohshow_after`
	ADD CONSTRAINT `PK_ohshow_after` -- ��ǰ �ı� �⺻Ű
		PRIMARY KEY (
			`after_id` -- ��ǰ �ı� ��ȣ
		);

ALTER TABLE `ohshow_after`
	MODIFY COLUMN `after_id` INT NOT NULL AUTO_INCREMENT COMMENT '��ǰ �ı� ��ȣ';

-- ��ǰ ����(Q&A)
CREATE TABLE `ohshow_qaboard` (
	`qaboard_id`       INT          NOT NULL COMMENT '���� ���� ��ȣ', -- ���� ���� ��ȣ
	`qaboard_type`     VARCHAR(50)  NULL     COMMENT '���� ����', -- ���� ����
	`qaboard_title`    VARCHAR(100) NULL     COMMENT '���� ����', -- ���� ����
	`qaboard_contents` VARCHAR(500) NULL     COMMENT '���� ����', -- ���� ����
	`user_id`          VARCHAR(50)  NULL     COMMENT 'ȸ�� ���̵�', -- ȸ�� ���̵�
	`sb_id`            INT          NULL     COMMENT '�Ǹ� �Խ��� ��ȣ' -- �Ǹ� �Խ��� ��ȣ
)
COMMENT '��ǰ ����(Q&A)';

-- ��ǰ ����(Q&A)
ALTER TABLE `ohshow_qaboard`
	ADD CONSTRAINT `PK_ohshow_qaboard` -- ��ǰ ����(Q&A) �⺻Ű
		PRIMARY KEY (
			`qaboard_id` -- ���� ���� ��ȣ
		);

ALTER TABLE `ohshow_qaboard`
	MODIFY COLUMN `qaboard_id` INT NOT NULL AUTO_INCREMENT COMMENT '���� ���� ��ȣ';

-- �ֹ�
CREATE TABLE `ohshow_order` (
	`order_id`      INT          NOT NULL COMMENT '�ֹ� ��ȣ', -- �ֹ� ��ȣ
	`oder_btype`    VARCHAR(50)  NOT NULL COMMENT '���� ����', -- ���� ����
	`order_date`    DATE         NOT NULL COMMENT '�ֹ� ����', -- �ֹ� ����
	`order_req`     VARCHAR(150) NULL     COMMENT '�ֹ� ��û ����', -- �ֹ� ��û ����
	`order_address` VARCHAR(250) NOT NULL COMMENT '�ֹ� �����', -- �ֹ� �����
	`order_status`  VARCHAR(50)  NULL     COMMENT '�ֹ� ���� ����', -- �ֹ� ���� ����
	`user_id`       VARCHAR(50)  NOT NULL COMMENT 'ȸ�� ���̵�' -- ȸ�� ���̵�
)
COMMENT '�ֹ�';

-- �ֹ�
ALTER TABLE `ohshow_order`
	ADD CONSTRAINT `PK_ohshow_order` -- �ֹ� �⺻Ű
		PRIMARY KEY (
			`order_id` -- �ֹ� ��ȣ
		);

ALTER TABLE `ohshow_order`
	MODIFY COLUMN `order_id` INT NOT NULL AUTO_INCREMENT COMMENT '�ֹ� ��ȣ';

-- �ֹ� �� ����
CREATE TABLE `ohshow_oreder_detail` (
	`od_id`      INT NOT NULL COMMENT '�ֹ� �� ���� ��ȣ', -- �ֹ� �� ���� ��ȣ
	`order_id`   INT NULL     COMMENT '�ֹ� ��ȣ', -- �ֹ� ��ȣ
	`product_id` INT NULL     COMMENT '��ǰ ���� ��ȣ' -- ��ǰ ���� ��ȣ
)
COMMENT '�ֹ� �� ����';

-- �ֹ� �� ����
ALTER TABLE `ohshow_oreder_detail`
	ADD CONSTRAINT `PK_ohshow_oreder_detail` -- �ֹ� �� ���� �⺻Ű
		PRIMARY KEY (
			`od_id` -- �ֹ� �� ���� ��ȣ
		);

ALTER TABLE `ohshow_oreder_detail`
	MODIFY COLUMN `od_id` INT NOT NULL AUTO_INCREMENT COMMENT '�ֹ� �� ���� ��ȣ';

-- �ù�
CREATE TABLE `ohshow_delivery` (
	`delivery_id`      VARCHAR(50)  NOT NULL COMMENT '�ù� ����� ��ȣ', -- �ù� ����� ��ȣ
	`delivery_company` VARCHAR(50)  NULL     COMMENT '�ù� ��ü��', -- �ù� ��ü��
	`delivery_pnum`    VARCHAR(50)  NULL     COMMENT '�ù�� ��ȭ��ȣ', -- �ù�� ��ȭ��ȣ
	`delivert_address` VARCHAR(250) NULL     COMMENT '�ù�� �ּ�', -- �ù�� �ּ�
	`admin_id`         VARCHAR(50)  NOT NULL COMMENT '������ ���̵�' -- ������ ���̵�
)
COMMENT '�ù�';

-- �ù�
ALTER TABLE `ohshow_delivery`
	ADD CONSTRAINT `PK_ohshow_delivery` -- �ù� �⺻Ű
		PRIMARY KEY (
			`delivery_id` -- �ù� ����� ��ȣ
		);

-- ������ ���� �ù�
CREATE TABLE `ohshow_maker_delivery` (
	`md_id`       INT         NOT NULL COMMENT '������ �ù� ��ȣ', -- ������ �ù� ��ȣ
	`maker_id`    INT         NULL     COMMENT '������ ���̵�', -- ������ ���̵�
	`delivery_id` VARCHAR(50) NULL     COMMENT '�ù� ����� ��ȣ' -- �ù� ����� ��ȣ
)
COMMENT '������ ���� �ù�';

-- ������ ���� �ù�
ALTER TABLE `ohshow_maker_delivery`
	ADD CONSTRAINT `PK_ohshow_maker_delivery` -- ������ ���� �ù� �⺻Ű
		PRIMARY KEY (
			`md_id` -- ������ �ù� ��ȣ
		);

ALTER TABLE `ohshow_maker_delivery`
	MODIFY COLUMN `md_id` INT NOT NULL AUTO_INCREMENT COMMENT '������ �ù� ��ȣ';

-- �ֹ� �ù� ����
CREATE TABLE `ohshow_order_delivery` (
	`od_id`     INT         NOT NULL COMMENT '�ֹ� �ù� ��ȣ', -- �ֹ� �ù� ��ȣ
	`od_status` VARCHAR(50) NULL     COMMENT '�ֹ� ��� ����', -- �ֹ� ��� ����
	`order_id`  INT         NOT NULL COMMENT '�ֹ� ��ȣ', -- �ֹ� ��ȣ
	`md_id`     INT         NOT NULL COMMENT '������ �ù� ��ȣ' -- ������ �ù� ��ȣ
)
COMMENT '�ֹ� �ù� ����';

-- �ֹ� �ù� ����
ALTER TABLE `ohshow_order_delivery`
	ADD CONSTRAINT `PK_ohshow_order_delivery` -- �ֹ� �ù� ���� �⺻Ű
		PRIMARY KEY (
			`od_id` -- �ֹ� �ù� ��ȣ
		);

ALTER TABLE `ohshow_order_delivery`
	MODIFY COLUMN `od_id` INT NOT NULL AUTO_INCREMENT COMMENT '�ֹ� �ù� ��ȣ';

-- ��ǰ �亯(Q&A)
CREATE TABLE `ohshow_answer` (
	`answer_id`       INT          NOT NULL COMMENT '��ǰ �亯 ��ȣ', -- ��ǰ �亯 ��ȣ
	`answer_contents` VARCHAR(500) NULL     COMMENT '�亯 ����', -- �亯 ����
	`maker_id`        INT          NULL     COMMENT '������ ���̵�', -- ������ ���̵�
	`qaboard_id`      INT          NULL     COMMENT '���� ���� ��ȣ' -- ���� ���� ��ȣ
)
COMMENT '��ǰ �亯(Q&A)';

-- ��ǰ �亯(Q&A)
ALTER TABLE `ohshow_answer`
	ADD CONSTRAINT `PK_ohshow_answer` -- ��ǰ �亯(Q&A) �⺻Ű
		PRIMARY KEY (
			`answer_id` -- ��ǰ �亯 ��ȣ
		);

ALTER TABLE `ohshow_answer`
	MODIFY COLUMN `answer_id` INT NOT NULL AUTO_INCREMENT COMMENT '��ǰ �亯 ��ȣ';

-- ��ٱ���
CREATE TABLE `ohshow_basket` (
	`basket_id`      INT         NOT NULL COMMENT '��ٱ��� ��ȣ', -- ��ٱ��� ��ȣ
	`basket_created` DATE        NULL     COMMENT '��ǰ �����', -- ��ǰ �����
	`user_id`        VARCHAR(50) NULL     COMMENT 'ȸ�� ���̵�', -- ȸ�� ���̵�
	`bd_id`          INT         NULL     COMMENT '��ٱ��� �� ���� ��ȣ' -- ��ٱ��� �� ���� ��ȣ
)
COMMENT '��ٱ���';

-- ��ٱ���
ALTER TABLE `ohshow_basket`
	ADD CONSTRAINT `PK_ohshow_basket` -- ��ٱ��� �⺻Ű
		PRIMARY KEY (
			`basket_id` -- ��ٱ��� ��ȣ
		);

ALTER TABLE `ohshow_basket`
	MODIFY COLUMN `basket_id` INT NOT NULL AUTO_INCREMENT COMMENT '��ٱ��� ��ȣ';

-- ��ٱ��� �� ����
CREATE TABLE `ohshow_basket_detail` (
	`bd_id`      INT NOT NULL COMMENT '��ٱ��� �� ���� ��ȣ', -- ��ٱ��� �� ���� ��ȣ
	`product_id` INT NULL     COMMENT '��ǰ ���� ��ȣ' -- ��ǰ ���� ��ȣ
)
COMMENT '��ٱ��� �� ����';

-- ��ٱ��� �� ����
ALTER TABLE `ohshow_basket_detail`
	ADD CONSTRAINT `PK_ohshow_basket_detail` -- ��ٱ��� �� ���� �⺻Ű
		PRIMARY KEY (
			`bd_id` -- ��ٱ��� �� ���� ��ȣ
		);

ALTER TABLE `ohshow_basket_detail`
	MODIFY COLUMN `bd_id` INT NOT NULL AUTO_INCREMENT COMMENT '��ٱ��� �� ���� ��ȣ';

-- ��������
CREATE TABLE `ohshow_notice` (
	`notice_id`       INT          NOT NULL COMMENT '�������� ��ȣ', -- �������� ��ȣ
	`notice_title`    VARCHAR(50)  NULL     COMMENT '���� ����', -- ���� ����
	`notice_contents` VARCHAR(512) NULL     COMMENT '���� ����', -- ���� ����
	`notice_date`     DATE         NULL     COMMENT '���� ����' -- ���� ����
)
COMMENT '��������';

-- ��������
ALTER TABLE `ohshow_notice`
	ADD CONSTRAINT `PK_ohshow_notice` -- �������� �⺻Ű
		PRIMARY KEY (
			`notice_id` -- �������� ��ȣ
		);

ALTER TABLE `ohshow_notice`
	MODIFY COLUMN `notice_id` INT NOT NULL AUTO_INCREMENT COMMENT '�������� ��ȣ';

-- ������
ALTER TABLE `ohshow_maker`
	ADD CONSTRAINT `FK_ohshow_makerbank_TO_ohshow_maker` -- ������ ���� ���� -> ������
		FOREIGN KEY (
			`makerbank_id` -- ���� ��ȣ
		)
		REFERENCES `ohshow_makerbank` ( -- ������ ���� ����
			`makerbank_id` -- ���� ��ȣ
		);

-- �Ǹ� �Խ���
ALTER TABLE `ohshow_sale_board`
	ADD CONSTRAINT `FK_ohshow_maker_TO_ohshow_sale_board` -- ������ -> �Ǹ� �Խ���
		FOREIGN KEY (
			`maker_id` -- ������ ���̵�
		)
		REFERENCES `ohshow_maker` ( -- ������
			`maker_id` -- ������ ���̵�
		);

-- �Ǹ� �Խ���
ALTER TABLE `ohshow_sale_board`
	ADD CONSTRAINT `FK_ohshow_file_TO_ohshow_sale_board` -- ���ε� ���� -> �Ǹ� �Խ���
		FOREIGN KEY (
			`file_id` -- ���� ��ȣ
		)
		REFERENCES `ohshow_file` ( -- ���ε� ����
			`file_id` -- ���� ��ȣ
		);

-- �Ǹ� ��ǰ ����
ALTER TABLE `ohshow_product`
	ADD CONSTRAINT `FK_ohshow_sale_board_TO_ohshow_product` -- �Ǹ� �Խ��� -> �Ǹ� ��ǰ ����
		FOREIGN KEY (
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		)
		REFERENCES `ohshow_sale_board` ( -- �Ǹ� �Խ���
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		);

-- ��ǰ �ı�
ALTER TABLE `ohshow_after`
	ADD CONSTRAINT `FK_ohshow_sale_board_TO_ohshow_after` -- �Ǹ� �Խ��� -> ��ǰ �ı�
		FOREIGN KEY (
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		)
		REFERENCES `ohshow_sale_board` ( -- �Ǹ� �Խ���
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		);

-- ��ǰ ����(Q&A)
ALTER TABLE `ohshow_qaboard`
	ADD CONSTRAINT `FK_ohshow_user_TO_ohshow_qaboard` -- ȸ�� -> ��ǰ ����(Q&A)
		FOREIGN KEY (
			`user_id` -- ȸ�� ���̵�
		)
		REFERENCES `ohshow_user` ( -- ȸ��
			`user_id` -- ȸ�� ���̵�
		);

-- ��ǰ ����(Q&A)
ALTER TABLE `ohshow_qaboard`
	ADD CONSTRAINT `FK_ohshow_sale_board_TO_ohshow_qaboard` -- �Ǹ� �Խ��� -> ��ǰ ����(Q&A)
		FOREIGN KEY (
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		)
		REFERENCES `ohshow_sale_board` ( -- �Ǹ� �Խ���
			`sb_id` -- �Ǹ� �Խ��� ��ȣ
		);

-- �ֹ�
ALTER TABLE `ohshow_order`
	ADD CONSTRAINT `FK_ohshow_user_TO_ohshow_order` -- ȸ�� -> �ֹ�
		FOREIGN KEY (
			`user_id` -- ȸ�� ���̵�
		)
		REFERENCES `ohshow_user` ( -- ȸ��
			`user_id` -- ȸ�� ���̵�
		);

-- �ֹ� �� ����
ALTER TABLE `ohshow_oreder_detail`
	ADD CONSTRAINT `FK_ohshow_order_TO_ohshow_oreder_detail` -- �ֹ� -> �ֹ� �� ����
		FOREIGN KEY (
			`order_id` -- �ֹ� ��ȣ
		)
		REFERENCES `ohshow_order` ( -- �ֹ�
			`order_id` -- �ֹ� ��ȣ
		);

-- �ֹ� �� ����
ALTER TABLE `ohshow_oreder_detail`
	ADD CONSTRAINT `FK_ohshow_product_TO_ohshow_oreder_detail` -- �Ǹ� ��ǰ ���� -> �ֹ� �� ����
		FOREIGN KEY (
			`product_id` -- ��ǰ ���� ��ȣ
		)
		REFERENCES `ohshow_product` ( -- �Ǹ� ��ǰ ����
			`product_id` -- ��ǰ ���� ��ȣ
		);

-- �ù�
ALTER TABLE `ohshow_delivery`
	ADD CONSTRAINT `FK_ohshow_admin_TO_ohshow_delivery` -- ������ -> �ù�
		FOREIGN KEY (
			`admin_id` -- ������ ���̵�
		)
		REFERENCES `ohshow_admin` ( -- ������
			`admin_id` -- ������ ���̵�
		);

-- ������ ���� �ù�
ALTER TABLE `ohshow_maker_delivery`
	ADD CONSTRAINT `FK_ohshow_maker_TO_ohshow_maker_delivery` -- ������ -> ������ ���� �ù�
		FOREIGN KEY (
			`maker_id` -- ������ ���̵�
		)
		REFERENCES `ohshow_maker` ( -- ������
			`maker_id` -- ������ ���̵�
		);

-- ������ ���� �ù�
ALTER TABLE `ohshow_maker_delivery`
	ADD CONSTRAINT `FK_ohshow_delivery_TO_ohshow_maker_delivery` -- �ù� -> ������ ���� �ù�
		FOREIGN KEY (
			`delivery_id` -- �ù� ����� ��ȣ
		)
		REFERENCES `ohshow_delivery` ( -- �ù�
			`delivery_id` -- �ù� ����� ��ȣ
		);

-- �ֹ� �ù� ����
ALTER TABLE `ohshow_order_delivery`
	ADD CONSTRAINT `FK_ohshow_order_TO_ohshow_order_delivery` -- �ֹ� -> �ֹ� �ù� ����
		FOREIGN KEY (
			`order_id` -- �ֹ� ��ȣ
		)
		REFERENCES `ohshow_order` ( -- �ֹ�
			`order_id` -- �ֹ� ��ȣ
		);

-- �ֹ� �ù� ����
ALTER TABLE `ohshow_order_delivery`
	ADD CONSTRAINT `FK_ohshow_maker_delivery_TO_ohshow_order_delivery` -- ������ ���� �ù� -> �ֹ� �ù� ����
		FOREIGN KEY (
			`md_id` -- ������ �ù� ��ȣ
		)
		REFERENCES `ohshow_maker_delivery` ( -- ������ ���� �ù�
			`md_id` -- ������ �ù� ��ȣ
		);

-- ��ǰ �亯(Q&A)
ALTER TABLE `ohshow_answer`
	ADD CONSTRAINT `FK_ohshow_maker_TO_ohshow_answer` -- ������ -> ��ǰ �亯(Q&A)
		FOREIGN KEY (
			`maker_id` -- ������ ���̵�
		)
		REFERENCES `ohshow_maker` ( -- ������
			`maker_id` -- ������ ���̵�
		);

-- ��ǰ �亯(Q&A)
ALTER TABLE `ohshow_answer`
	ADD CONSTRAINT `FK_ohshow_qaboard_TO_ohshow_answer` -- ��ǰ ����(Q&A) -> ��ǰ �亯(Q&A)
		FOREIGN KEY (
			`qaboard_id` -- ���� ���� ��ȣ
		)
		REFERENCES `ohshow_qaboard` ( -- ��ǰ ����(Q&A)
			`qaboard_id` -- ���� ���� ��ȣ
		);

-- ��ٱ���
ALTER TABLE `ohshow_basket`
	ADD CONSTRAINT `FK_ohshow_user_TO_ohshow_basket` -- ȸ�� -> ��ٱ���
		FOREIGN KEY (
			`user_id` -- ȸ�� ���̵�
		)
		REFERENCES `ohshow_user` ( -- ȸ��
			`user_id` -- ȸ�� ���̵�
		);

-- ��ٱ���
ALTER TABLE `ohshow_basket`
	ADD CONSTRAINT `FK_ohshow_basket_detail_TO_ohshow_basket` -- ��ٱ��� �� ���� -> ��ٱ���
		FOREIGN KEY (
			`bd_id` -- ��ٱ��� �� ���� ��ȣ
		)
		REFERENCES `ohshow_basket_detail` ( -- ��ٱ��� �� ����
			`bd_id` -- ��ٱ��� �� ���� ��ȣ
		);

-- ��ٱ��� �� ����
ALTER TABLE `ohshow_basket_detail`
	ADD CONSTRAINT `FK_ohshow_product_TO_ohshow_basket_detail` -- �Ǹ� ��ǰ ���� -> ��ٱ��� �� ����
		FOREIGN KEY (
			`product_id` -- ��ǰ ���� ��ȣ
		)
		REFERENCES `ohshow_product` ( -- �Ǹ� ��ǰ ����
			`product_id` -- ��ǰ ���� ��ȣ
		);