-- Creamos la base de datos
create database sueldos;
-- Seleccionamos la base de datos a utilizar e importamos la tabla en formato csv
use sueldos;
-- Hacemos una consulta para ver que contiene la tabla
select * from ds_salaries;
-- consultamos y modificamos la primera columna del año
select distinct work_year from ds_salaries;
--alter table ds_salaries rename column work_year to año;
exec sp_rename 'ds_salaries.work_year','año'
-- consultamos y modificamos la segunda columna con el nivel de experiencia
select distinct experience_level from ds_salaries;
alter table ds_salaries rename column experience_level to experiencia;
-- renombramos los niveles para faciltiar el analisis
update ds_salaries set experiencia='Junior' where experiencia='EN';
update ds_salaries set experiencia='Semi Senior' where experiencia='MI';
update ds_salaries set experiencia='Senior' where experiencia='SE';
update ds_salaries set experiencia='Executive' where experiencia='EX';
-- consultamos y modificamos la tercera columna con el tipo de modalidad
select distinct employment_type from ds_salaries;
alter table ds_salaries rename column employment_type to modalidad;
-- renombramos las modalidades para faciltiar el analisis
update ds_salaries set modalidad='Full Time' where modalidad='FT';
update ds_salaries set modalidad='Contractor' where modalidad='CT';
update ds_salaries set modalidad='Freelance' where modalidad='FL';
update ds_salaries set modalidad='Part Time' where modalidad='PT';
-- consultamos y modificamos la cuarta columna con las posiciones
select distinct job_title from ds_salaries;
alter table ds_salaries rename column job_title to posicion;
-- renombramos y unificamos las posiciones para faciltiar el analisis
update ds_salaries set posicion='Analista de datos' where 
posicion='Business Data Analyst' or 
posicion='Data Analyst' or 
posicion='Analytics Engineer' or 
posicion='Data Quality Analyst' or 
posicion='Compliance Data Analyst' or 
posicion='Staff Data Analyst' or
posicion='Financial Data Analyst' or
posicion='Data Analytics Specialist' or
posicion='Insight Analyst' or
posicion='Product Data Analyst' or
posicion='Data Analytics Consultant' or
posicion='Marketing Data Analyst' or
posicion='Principal Data Analyst' or
posicion='Data Operations Analyst' or
posicion='Finance Data Analyst';
update ds_salaries set posicion='Cientifico de datos' where 
posicion='Principal Data Scientist' or 
posicion='Data Srategist' or 
posicion='Data Scientist' or
posicion='Applied Scientist' or 
posicion='Applied Data Scientist' or 
posicion='Data Science Consultant' or
posicion='Data Science Engineer' or   
posicion='Product Data Scientist' or 
posicion='Staff Data Scientist';
update ds_salaries set posicion='Ingeniero de datos' where 
posicion='Research Engineer' or 
posicion='Data Engineer' or
posicion='Data DevOps Engineer' or
posicion='Big Data Engineer' or 
posicion='Computer Vision Engineer' or 
posicion='Computer Vision Software Engineer' or 
posicion='MLOps Engineer' or 
posicion='Software Data Engineer' or 
posicion='Principal Data Engineer' or 
posicion='Cloud Data Engineer' or 
posicion='Data Analytics Engineer' or
posicion='NLP Engineer' or
posicion='Azure Data Engineer' or
posicion='ETL Engineer' or
posicion='ETL Developer' or
posicion='Marketing Data Engineer' or
posicion='Data Operations Engineer';
update ds_salaries set posicion='Ingeniero de Machine Learning' where 
posicion='ML Engineer' or 
posicion='Machine Learning Engineer' or 
posicion='Applied Machine Learning Engineer' or 
posicion='AI Developer' or
posicion='Machine Learning Researcher' or
posicion='AI Programmer' or  
posicion='Machine Learning Infrastructure Engineer' or 
posicion='Deep Learning Engineer' or 
posicion='Machine Learning Software Engineer' or 
posicion='Machine Learning Research Engineer' or
posicion='Principal Machine Learning Engineer' or
posicion='Cloud Database Engineer' or
posicion='Data Infrastructure Engineer' ;
update ds_salaries set posicion='Cientifico de Machine Learning' where 
posicion='Machine Learning Scientist' or 
posicion='Machine Learning Developer' or 
posicion='AI Scientist' or 
posicion='Applied Machine Learning Scientist';
update ds_salaries set posicion='Modelador de datos' where 
posicion='Data Modeler';
update ds_salaries set posicion='Ingeniero de BI' where 
posicion='Business Intelligence Engineer' or
posicion='BI Data Engineer' or
posicion='BI Developer' or
posicion='Power BI Developer';
update ds_salaries set posicion='Analista de BI' where 
posicion='BI Analyst' or
posicion='BI Data Analyst';
update ds_salaries set posicion='Investigador de datos' where 
posicion like '%research%';
update ds_salaries set posicion='Especialista en datos' where 
posicion like '%Specialist%';
update ds_salaries set posicion='Arquitecto de datos' where 
posicion='Data Architect' or
posicion='Principal Data Architect' or
posicion='Cloud Data Architect' or
posicion='Big Data Architect';
update ds_salaries set posicion='Lider de equipo' where 
posicion like '%Manager%' or 
posicion like '%Lead%' or
posicion like '%Director%' or
posicion like '%Head%';
-- modificamos el resto de las columnas
alter table ds_salaries rename column salary to salario;
alter table ds_salaries rename column salary_currency to moneda;
alter table ds_salaries rename column salary_in_usd to salario_en_dolares;
alter table ds_salaries rename column employee_residence to localidad;
alter table ds_salaries rename column remote_ratio to esquema;
alter table ds_salaries rename column company_location to localidad_empresa;
alter table ds_salaries rename column company_size to tamaño_empresa;
-- renombramos los tipos de esquema para faciltiar el analisis
--alter table ds_salaries modify esquema varchar(10);
alter table ds_salaries alter column esquema varchar(10);
 
update ds_salaries set esquema='Remoto' where 
esquema='100';
update ds_salaries set esquema='Hibrido' where 
esquema='50';
update ds_salaries set esquema='Presencial' where 
esquema='0';
-- eliminamos un empleo que no correspondia con ciencia de datos
delete from ds_salaries where posicion='Autonomous Vehicle Technician';
select * from ds_salaries;


