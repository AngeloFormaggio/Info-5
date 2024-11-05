create table prova5f.mobo(
fattore_forma varchar(20),
slot_ram int,
socket_pga bool,
data_bios datetime
);

insert into prova5f.mobo
(fattore_forma,slot_ram,socket_pga,data_bios)
values
("ATX",4,false,"2024/10/02"),
("Mini ATX",2,true,"2020/04/28"),
("ATX",4,true,"2021/12/15"),
("Micro ATX",2,true,"2023/05/05"),
("Micro ATX",2,false,"2022/10/31"),
("AX",6,true,"2019/11/01"),
("AX",4,false,"2015/07/20"),
("Mini ATX",2,true,"2022/08/21"),
("ATX",6,true,"2024/02/09"),
("Mini ATX",4,false,"2023/01/26");

select * from prova5f.mobo m;

select count(*) as caseATX from prova5f.mobo m where m.fattore_forma ="ATX";

select count(*) as caseATXeAX from prova5f.mobo m where m.fattore_forma = "ATX" || m.fattore_forma = "AX";

-- mostra Tipo fattore e numero dei fattori
select m.fattore_forma,count(m.fattore_forma) as caseATX from prova5f.mobo m group by m.fattore_forma having m.fattore_forma ="ATX" || m.fattore_forma="AX";

-- solo i fattori maggiori di 2
select m.fattore_forma,count(m.fattore_forma) as caseATX from prova5f.mobo m group by m.fattore_forma having count(*) > 2;

-- visualizza quanti giorni dall'ultimo agg bios
-- ?

-- inserire pk
alter table prova5f.mobo add column n_serie int primary key auto_increment;





