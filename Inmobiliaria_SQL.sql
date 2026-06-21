#Ver los registros de propiedades
select * from propiedades;

#Ver todos los propietarios
select * from propietarios;

#Ver algunas columnas
select ï»¿Property_ID, Location, Price  from propiedades; 

#Buscar propiedades caras
select * from propiedades
where price >200000;

#Buscar propietarios con mas antiguedad
select * from propietarios
where Years_Owner>5;

#CONSULTAS INTERMEDIAS
#Contar propiedades por ubicación
select location, count(*) as Total_propiedades 
from propiedades 
group by location;

#Calcular precio promedio por ubicación
select location, AVG(price) as Precio_promedio
from propiedades 
group by location;

#Ordenar propiedades por precio
select * from propiedades order by price desc;

#Filtrar propiedades con cierto número de habitaciones
select * from propiedades
where rooms >= 3
order by price desc;

#Relacionar propiedades con propetarios
select 
      p.ï»¿Property_ID,
      p.Location,
      p.Price,
      pr.owner_name 
from propiedades p 
inner join propietarios pr 
on p.ï»¿Property_ID = pr.ï»¿Property_ID;

#CONSULTAS AVANZADAS 
#Propietarios con propiedades de alto valor
select
      pr.owner_name,
      p.location,
      p.price
from propiedades p 
inner join propietarios pr
on p.ï»¿Property_ID = pr.ï»¿Property_ID
where p.price > 300000;

#Dashboard resumido por ubicación
select 
      Location,
      Count(*) total,
      AVG(price) as promedio,
      max(price) as máximo,
      min(price) as mínimo
from propiedades 
group by location; 

#Clasificar propiedades por precio
select 
      ï»¿Property_ID,
      price, 
      CASE 
          WHEN price >=300000 then "Alta"
          WHEN price >=150000 then "Media"
          ELSE "Baja"
	  END as Categoría 
From propiedades; 


#Encontrar zonas con precios promedios altos
select
      Location,
      AVG(price) as Precio_Promedio
from Propiedades 
group by Location 
having AVG(price) > 200000; 

#Buscar registros sin correspondencia
select 
      pr. owner_name 
from propietarios pr 
left join propiedades p 
ON PR.ï»¿Property_ID = p.ï»¿Property_ID
where p.ï»¿Property_ID is null; 
