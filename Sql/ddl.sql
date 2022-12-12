create table company 

       (id number, 
        name varchar2(100),
        primary key (id)
       );

create table brand 
       
        (id number,
        company_id number,
        name varchar2(100),
        PRIMARY KEY (id),
        FOREIGN KEY (company_id) REFERENCES company(id)
       );

create table models  

       (id number, 
        brand_id number, 
        body_style varchar2(100),
        name varchar2(100),
        PRIMARY KEY (id),
        FOREIGN KEY (brand_id) REFERENCES brand(id)
        );

create table products 
      
       (id number,
        model_id number, 
        color varchar2(100),
        product_type varchar2(100),
        PRIMARY KEY (id),
        FOREIGN KEY (model_id) REFERENCES models(id)
       );

create table customers 
       (id number, 
        customer_type varchar2(50), 
        name varchar2(100), 
        address varchar2(200), 
        Gender varchar2(10),
        PRIMARY KEY (id)        
        );

create table suppliers

       (id number,
        supplier_type varchar2(50), 
        name varchar2(100), 
        address varchar2(200),
        PRIMARY KEY (id)
       );

create table inventory_master 

       (id number,
        model_id number, 
        color varchar2(100), 
        total_quantity number,
        PRIMARY KEY (id),
        FOREIGN KEY (model_id) REFERENCES models(id)
       );

create table inventory_details 

       (id number, 
        inventory_master_id number, 
        vin varchar2(100) NOT NULL UNIQUE, 
        quantity number, 
        supplier_id number,
        PRIMARY KEY (id),
        FOREIGN KEY (inventory_master_id) REFERENCES  
        inventory_master(id),
        FOREIGN KEY (supplier_id) REFERENCES  
        suppliers(id)
       );


create table sales_master 

       (id number, 
        customer_id number, 
        invoice_number varchar2(100) NOT NULL UNIQUE, 
        invoice_date date, 
        total_quantity number, 
        total_amount number,
        PRIMARY KEY (id),
        FOREIGN KEY (customer_id) REFERENCES  
        customers(id)
       );

create table sales_details 

      (id number, 
       sales_master_id number, 
       inventory_details_id number, 
       quantity number, 
       rate number, 
       amount number,
       PRIMARY KEY (id),
       FOREIGN KEY (sales_master_id) REFERENCES  
       sales_master(id),
       FOREIGN KEY (inventory_details_id) REFERENCES  
       inventory_details (id )
      );


create table purchase_master 
      
     (id number,
      purchase_date date, 
      supplier_id number,
      PRIMARY KEY (id),
      FOREIGN KEY (supplier_id) REFERENCES  
      suppliers(id)
     );

create table purchase_details 

     (id number, 
      purchase_master_id number, 
      product_id number,
      PRIMARY KEY (id),
      FOREIGN KEY (purchase_master_id) REFERENCES  
      purchase_master(id),
      FOREIGN KEY (product_id) REFERENCES  
      products(id)
     );