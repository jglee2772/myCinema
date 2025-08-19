-- MySQL에서 PostgreSQL로 데이터 추출 스크립트
-- MySQL Workbench에서 실행하여 INSERT 문들을 생성

-- customer 테이블 데이터 추출
SELECT CONCAT('INSERT INTO customer (id, uid, passwd, realname, nickname, email, region, favorite, mobile, tellecom, created, updated, birthday, profileimg) VALUES (', 
    id, ', ''', 
    COALESCE(uid, ''), ''', ''', 
    COALESCE(passwd, ''), ''', ''', 
    COALESCE(realname, ''), ''', ''', 
    COALESCE(nickname, ''), ''', ''', 
    COALESCE(email, ''), ''', ''', 
    COALESCE(region, ''), ''', ''', 
    COALESCE(favorite, ''), ''', ''', 
    COALESCE(mobile, ''), ''', ''', 
    COALESCE(tellecom, ''), ''', ''', 
    COALESCE(created, ''), ''', ''', 
    COALESCE(updated, ''), ''', ''', 
    COALESCE(birthday, ''), ''', ''', 
    COALESCE(profileimg, ''), ''');') as insert_statement
FROM customer;

-- movie 테이블 데이터 추출
SELECT CONCAT('INSERT INTO movie (id, mname, age, runningtime, hit, reservation, imagepath, director, cast, genre, releasedate, movieinfo, avgrate) VALUES (', 
    id, ', ''', 
    COALESCE(mname, ''), ''', ''', 
    COALESCE(age, ''), ''', ''', 
    COALESCE(runningtime, ''), ''', ''', 
    COALESCE(hit, ''), ''', ', 
    COALESCE(reservation, 0), ', ''', 
    COALESCE(imagepath, ''), ''', ''', 
    COALESCE(director, ''), ''', ''', 
    COALESCE(cast, ''), ''', ''', 
    COALESCE(genre, ''), ''', ''', 
    COALESCE(releasedate, ''), ''', ''', 
    COALESCE(movieinfo, ''), ''', ', 
    COALESCE(avgrate, 0), ');') as insert_statement
FROM movie;

-- moviepay 테이블 데이터 추출
SELECT CONCAT('INSERT INTO moviepay (id, random_id, customer_id, movie_name, room_name, totalprice, runningtime, seat, totalpeople, datetime, begintime, endtime, created) VALUES (', 
    id, ', ''', 
    COALESCE(random_id, ''), ''', ''', 
    COALESCE(customer_id, ''), ''', ''', 
    COALESCE(movie_name, ''), ''', ''', 
    COALESCE(room_name, ''), ''', ''', 
    COALESCE(totalprice, ''), ''', ''', 
    COALESCE(runningtime, ''), ''', ''', 
    COALESCE(seat, ''), ''', ''', 
    COALESCE(totalpeople, ''), ''', ''', 
    COALESCE(datetime, ''), ''', ''', 
    COALESCE(begintime, ''), ''', ''', 
    COALESCE(endtime, ''), ''', ''', 
    COALESCE(created, ''), ''');') as insert_statement
FROM moviepay;

-- moviedelete 테이블 데이터 추출
SELECT CONCAT('INSERT INTO moviedelete (id, random_id, customer_id, movie_name, room_name, totalprice, runningtime, seat, totalpeople, datetime, begintime, endtime, created) VALUES (', 
    id, ', ''', 
    COALESCE(random_id, ''), ''', ''', 
    COALESCE(customer_id, ''), ''', ''', 
    COALESCE(movie_name, ''), ''', ''', 
    COALESCE(room_name, ''), ''', ''', 
    COALESCE(totalprice, ''), ''', ''', 
    COALESCE(runningtime, ''), ''', ''', 
    COALESCE(seat, ''), ''', ''', 
    COALESCE(totalpeople, ''), ''', ''', 
    COALESCE(datetime, ''), ''', ''', 
    COALESCE(begintime, ''), ''', ''', 
    COALESCE(endtime, ''), ''', ''', 
    COALESCE(created, ''), ''');') as insert_statement
FROM moviedelete;

-- appearance_info 테이블 데이터 추출
SELECT CONCAT('INSERT INTO appearance_info (id, moviename, prod, actor, image_path) VALUES (', 
    id, ', ''', 
    COALESCE(moviename, ''), ''', ''', 
    COALESCE(prod, ''), ''', ''', 
    COALESCE(actor, ''), ''', ''', 
    COALESCE(image_path, ''), ''');') as insert_statement
FROM appearance_info;

-- cart 테이블 데이터 추출
SELECT CONCAT('INSERT INTO cart (id, customer_id, item_id, qty, total, created, cust_id) VALUES (', 
    id, ', ''', 
    COALESCE(customer_id, ''), ''', ', 
    COALESCE(item_id, 0), ', ''', 
    COALESCE(qty, ''), ''', ', 
    COALESCE(total, 0), ', ''', 
    COALESCE(created, ''), ''', ', 
    COALESCE(cust_id, 0), ');') as insert_statement
FROM cart;

-- chartarray 테이블 데이터 추출
SELECT CONCAT('INSERT INTO chartarray (id, text) VALUES (', 
    id, ', ''', 
    COALESCE(text, ''), ''');') as insert_statement
FROM chartarray;

-- commentarray 테이블 데이터 추출
SELECT CONCAT('INSERT INTO commentarray (id, text) VALUES (', 
    id, ', ''', 
    COALESCE(text, ''), ''');') as insert_statement
FROM commentarray;

-- faq 테이블 데이터 추출
SELECT CONCAT('INSERT INTO faq (id, selected, title, content, created_at, views) VALUES (', 
    id, ', ''', 
    COALESCE(selected, ''), ''', ''', 
    COALESCE(title, ''), ''', ''', 
    COALESCE(content, ''), ''', ''', 
    COALESCE(created_at, ''), ''', ', 
    COALESCE(views, 0), ');') as insert_statement
FROM faq;

-- inquiry 테이블 데이터 추출
SELECT CONCAT('INSERT INTO inquiry (id, customer_id, title, content, answer, created, ancreated, current) VALUES (', 
    id, ', ', 
    COALESCE(customer_id, 0), ', ''', 
    COALESCE(title, ''), ''', ''', 
    COALESCE(content, ''), ''', ''', 
    COALESCE(answer, ''), ''', ''', 
    COALESCE(created, ''), ''', ''', 
    COALESCE(ancreated, ''), ''', ''', 
    COALESCE(current, ''), ''');') as insert_statement
FROM inquiry;

-- item 테이블 데이터 추출
SELECT CONCAT('INSERT INTO item (id, item_name, price, discount_price, composition, origin, image_path, item_type, period, best_id) VALUES (', 
    id, ', ''', 
    COALESCE(item_name, ''), ''', ''', 
    COALESCE(price, ''), ''', ''', 
    COALESCE(discount_price, ''), ''', ''', 
    COALESCE(composition, ''), ''', ''', 
    COALESCE(origin, ''), ''', ''', 
    COALESCE(image_path, ''), ''', ''', 
    COALESCE(item_type, ''), ''', ''', 
    COALESCE(period, ''), ''', ', 
    COALESCE(best_id, 0), ');') as insert_statement
FROM item;

-- news 테이블 데이터 추출
SELECT CONCAT('INSERT INTO news (id, selected, title, content, created_at, views) VALUES (', 
    id, ', ''', 
    COALESCE(selected, ''), ''', ''', 
    COALESCE(title, ''), ''', ''', 
    COALESCE(content, ''), ''', ''', 
    COALESCE(created_at, ''), ''', ', 
    COALESCE(views, 0), ');') as insert_statement
FROM news;

-- review 테이블 데이터 추출
SELECT CONCAT('INSERT INTO review (id, moviechart, content, writer, created_at, liked, customer_uid, updated_at, rate) VALUES (', 
    id, ', ', 
    COALESCE(moviechart, 0), ', ''', 
    COALESCE(content, ''), ''', ''', 
    COALESCE(writer, ''), ''', ''', 
    COALESCE(created_at, ''), ''', ', 
    COALESCE(liked, 0), ', ''', 
    COALESCE(customer_uid, ''), ''', ''', 
    COALESCE(updated_at, ''), ''', ', 
    COALESCE(rate, 0), ');') as insert_statement
FROM review;

-- room 테이블 데이터 추출
SELECT CONCAT('INSERT INTO room (id, Sname, seatlevel, seatinfo_id, adult_price, young_price) VALUES (', 
    id, ', ''', 
    COALESCE(Sname, ''), ''', ''', 
    COALESCE(seatlevel, ''), ''', ', 
    COALESCE(seatinfo_id, 0), ', ', 
    COALESCE(adult_price, 0), ', ', 
    COALESCE(young_price, 0), ');') as insert_statement
FROM room;

-- schedules 테이블 데이터 추출
SELECT CONCAT('INSERT INTO schedules (id, movie_id, room_id, moviedate, begintime, endtime, lestseat, a_price, y_price, timetype) VALUES (', 
    id, ', ', 
    COALESCE(movie_id, 0), ', ', 
    COALESCE(room_id, 0), ', ''', 
    COALESCE(moviedate, ''), ''', ''', 
    COALESCE(begintime, ''), ''', ''', 
    COALESCE(endtime, ''), ''', ', 
    COALESCE(lestseat, 0), ', ', 
    COALESCE(a_price, 0), ', ', 
    COALESCE(y_price, 0), ', ''', 
    COALESCE(timetype, ''), ''');') as insert_statement
FROM schedules;

-- seatinfo 테이블 데이터 추출
SELECT CONCAT('INSERT INTO seatinfo (id, sname, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, allseat) VALUES (', 
    id, ', ''', 
    COALESCE(sname, ''), ''', ', 
    COALESCE(A, 0), ', ', 
    COALESCE(B, 0), ', ', 
    COALESCE(C, 0), ', ', 
    COALESCE(D, 0), ', ', 
    COALESCE(E, 0), ', ', 
    COALESCE(F, 0), ', ', 
    COALESCE(G, 0), ', ', 
    COALESCE(H, 0), ', ', 
    COALESCE(I, 0), ', ', 
    COALESCE(J, 0), ', ', 
    COALESCE(K, 0), ', ', 
    COALESCE(L, 0), ', ', 
    COALESCE(M, 0), ', ', 
    COALESCE(N, 0), ', ', 
    COALESCE(O, 0), ', ', 
    COALESCE(allseat, 0), ');') as insert_statement
FROM seatinfo;

-- storepay 테이블 데이터 추출
SELECT CONCAT('INSERT INTO storepay (id, customer_id, random_id, item_name, totalprice, created, updated) VALUES (', 
    id, ', ''', 
    COALESCE(customer_id, ''), ''', ''', 
    COALESCE(random_id, ''), ''', ''', 
    COALESCE(item_name, ''), ''', ', 
    COALESCE(totalprice, 0), ', ''', 
    COALESCE(created, ''), ''', ''', 
    COALESCE(updated, ''), ''');') as insert_statement
FROM storepay;

-- storepaydelete 테이블 데이터 추출
SELECT CONCAT('INSERT INTO storepaydelete (id, customer_id, random_id, item_name, totalprice, created, updated) VALUES (', 
    id, ', ''', 
    COALESCE(customer_id, ''), ''', ''', 
    COALESCE(random_id, ''), ''', ''', 
    COALESCE(item_name, ''), ''', ', 
    COALESCE(totalprice, 0), ', ''', 
    COALESCE(created, ''), ''', ''', 
    COALESCE(updated, ''), ''');') as insert_statement
FROM storepaydelete;
