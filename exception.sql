create or replace trigger before_ins_user
before insert on site_user
for each row 
declare
password_is_right exception;
begin 
if length(:new.pass) < 5 then raise password_is_right;
end if;
exception
when password_is_right then
RAISE_APPLICATION_ERROR(-20001, 'The password should be more than 5 symbols');
end;
