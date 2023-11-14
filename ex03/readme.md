create SEQUENCE seq_board start with 1 increment by 1; create table tbl_board(bno number(10,0),title varchar2(200) not null,content varchar2(2000) not null,writer varchar2(50) not null,regidate date default sysdate,updatedate date default sysdate );

alter table tbl_board add constraint pk_board primary key(bno); select * from tbl_board; insert into tbl_board (bno, title, content, writer)values (seq_board.nextval, '테스트 제목5', '테스트 내용5', 'user005');
create table tbl_reply(
    rno number(10, 0),
    bno number(10, 0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_reply;
alter table tbl_reply add constraint pk_reply primary key(rno);
alter table tbl_reply add constraint fk_reply_board FOREIGN key(bno) references tbl_board(bno);