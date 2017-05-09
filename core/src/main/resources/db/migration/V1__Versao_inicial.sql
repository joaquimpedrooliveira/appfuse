CREATE TABLE app_user
(
   id bigint PRIMARY KEY NOT NULL,
   account_expired bit NOT NULL,
   account_locked bit NOT NULL,
   address varchar(150),
   city varchar(50),
   country varchar(100),
   postal_code varchar(15),
   province varchar(100),
   credentials_expired bit NOT NULL,
   email varchar(255) NOT NULL,
   account_enabled bit,
   first_name varchar(50) NOT NULL,
   last_name varchar(50) NOT NULL,
   password varchar(255) NOT NULL,
   password_hint varchar(255),
   phone_number varchar(255),
   username varchar(50) NOT NULL,
   version int,
   website varchar(255)
)
;
CREATE UNIQUE INDEX PRIMARY_KEY ON app_user(id)
;
CREATE UNIQUE INDEX UK_3k4cplvh82srueuttfkwnylq0 ON app_user(username)
;
CREATE UNIQUE INDEX UK_1j9d9a06i600gd43uu3km82jw ON app_user(email)
;

CREATE TABLE role
(
   id bigint PRIMARY KEY NOT NULL,
   description varchar(64),
   name varchar(20)
)
;
CREATE UNIQUE INDEX PRIMARY_KEY ON role(id)
;
CREATE TABLE user_role
(
   user_id bigint NOT NULL,
   role_id bigint NOT NULL,
   PRIMARY KEY (user_id,role_id)
)
;
ALTER TABLE user_role
ADD CONSTRAINT FK_apcc8lxk2xnug8377fatvbn04
FOREIGN KEY (user_id)
REFERENCES app_user(id)
;
ALTER TABLE user_role
ADD CONSTRAINT FK_it77eq964jhfqtu54081ebtio
FOREIGN KEY (role_id)
REFERENCES role(id)
;
CREATE UNIQUE INDEX PRIMARY_KEY ON user_role
(
  user_id,
  role_id
)
;
CREATE INDEX FK_it77eq964jhfqtu54081ebtio ON user_role(role_id)
;


-- INSERTS APP_USER
INSERT INTO app_user (id,account_expired,account_locked,address,city,country,postal_code,province,credentials_expired,email,account_enabled,first_name,last_name,password,password_hint,phone_number,username,version,website) VALUES (-3,0,0,'','Denver','US','80210','CO',0,'two_roles_user@appfuse.org',1,'Two Roles','User','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.','','two_roles_user',1,'http://raibledesigns.com');
INSERT INTO app_user (id,account_expired,account_locked,address,city,country,postal_code,province,credentials_expired,email,account_enabled,first_name,last_name,password,password_hint,phone_number,username,version,website) VALUES (-2,0,0,'','Denver','US','80210','CO',0,'matt@raibledesigns.com',1,'Matt','Raible','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.','','admin',1,'http://raibledesigns.com');
INSERT INTO app_user (id,account_expired,account_locked,address,city,country,postal_code,province,credentials_expired,email,account_enabled,first_name,last_name,password,password_hint,phone_number,username,version,website) VALUES (-1,0,0,'','Denver','US','80210','CO',0,'matt_raible@yahoo.com',1,'Tomcat','User','$2a$10$CnQVJ9bsWBjMpeSKrrdDEeuIptZxXrwtI6CZ/OgtNxhIgpKxXeT9y','A male kitty.','','user',1,'http://tomcat.apache.org');

-- INSERT ROLE
INSERT INTO role (id,description,name) VALUES (-2,'Default role for all Users','ROLE_USER');
INSERT INTO role (id,description,name) VALUES (-1,'Administrator role (can edit Users)','ROLE_ADMIN');

-- INSERT USER_ROLE

INSERT INTO user_role (user_id,role_id) VALUES (-3,-2);
INSERT INTO user_role (user_id,role_id) VALUES (-3,-1);
INSERT INTO user_role (user_id,role_id) VALUES (-2,-1);
INSERT INTO user_role (user_id,role_id) VALUES (-1,-2);
