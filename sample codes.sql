select * from employees;
-- Question no. 3
DELIMITER //

DROP PROCEDURE IF EXISTS printEmployee;

create procedure printEmployee(IN empid INT)
Begin
	declare emp_name varchar(50);
    declare supervisor int;
    
    select concat(firstName,lastName), reportsTo into emp_name, supervisor
    from employees where employees.employeeNumber = empid;
    
    select concat(emp_name,' reports to ', supervisor) as output;
    
End
//

delimiter ;

-- test

call printEmployee(1056);

-- Question no. 4

Delimiter //

drop function if exists TotalAmountPayable;

create function TotalAmountPayable(orderno int)
	returns decimal(15,2)
	deterministic    
begin
	declare totalamount decimal(15,2);
    declare order_status varchar(20);
    
    select sum(priceEach*quantityOrdered), status into totalamount, order_status
    from orderdetails natural join orders where orderNumber = orderno;
    
    if order_status = "shipped" then
		return totalamount;
	else 
		return (-1);
	end if;
end
//

delimiter ;

-- test

select TotalAmountPayable(10100);


-- Question no. 6
DELIMITER //

DROP PROCEDURE IF EXISTS printCustomer;

create procedure printCustomer()
Begin
	declare v_finished int default 0;
    declare cno int(11);
    declare cname varchar(50);
    declare cus_rec cursor for
		select customerNumber, customerName
        from customers where state ='NSW' and city like "%RYDE%" and country = "Australia";
	declare continue handler for not found set v_finished = 1;
    
    open cus_rec;
    repeat
		fetch cus_rec into cno, cname; 
		select cno as `Customer Number`, cname as `Customer Name`;
    until v_finished
    end repeat;
    close cus_rec;
End
//

delimiter ;

-- test

call printCustomer();


-- question 8
delimiter //

create trigger check_CreditLimits
before insert on customers
for each row
begin
	declare msg varchar(100);
    declare min_limit decimal(10,2) default 5000;
    
    if new.CreditLimit < min_limit then
		set msg = "Error! the minimum credit limit should 5000";
		signal sqlstate '45000' set message_text = msg;
    end if;

end
//
delimiter ;

-- test

insert into customers values
(497,'Kyle\'s Gift Shop','Snowden','Tony','+64 9 5555500','Arenales 1938 3\'A\'',NULL,'Auckland  ',NULL,NULL,'New Zealand',1612,'4999');

