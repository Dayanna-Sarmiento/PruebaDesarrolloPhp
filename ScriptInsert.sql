

INSERT INTO public.habitaciones
(idhabitacion, hotelid, habitacionacomodacionid, cantidad)
VALUES(1, 1, 1, 25);
INSERT INTO public.habitaciones
(idhabitacion, hotelid, habitacionacomodacionid, cantidad)
VALUES(2,1,3,12);
INSERT INTO public.habitaciones
(idhabitacion, hotelid, habitacionacomodacionid, cantidad)
VALUES(3,1,2,5);

INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(1, 1, 1);
INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(2,1,2);

INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(3,2,3);
INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(4,2,4);

INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(5,3,1);
INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(6,3,2);
INSERT INTO public.habitacionacomodacion
(idhabitacionacomodacion, habitaciontipoid, tipoacomodacionid)
VALUES(7,3,3);

INSERT INTO public.tipoacomodacion
(idtipoacomodacion, tipoacomodacion)
VALUES(1, 'Sencilla');

INSERT INTO public.tipoacomodacion
(idtipoacomodacion, tipoacomodacion)
VALUES(2, 'Doble');

INSERT INTO public.tipoacomodacion
(idtipoacomodacion, tipoacomodacion)
VALUES(3, 'Triple');

INSERT INTO public.tipoacomodacion
(idtipoacomodacion, tipoacomodacion)
VALUES(4, 'Cuadruple');
 
INSERT INTO public.tipoHabitacion
(idhabitaciontipo, tipohabitacion)
VALUES(1,'Estandar');

INSERT INTO public.tipoHabitacion
(idhabitaciontipo,tipohabitacion)
VALUES(2,'Junior');

INSERT INTO public.tipoHabitacion
(idhabitaciontipo,tipohabitacion)
VALUES(3,'Suite');

INSERT INTO public.hoteles
(idhotel, nombrehotel, direccionhotel, nit,  numerohabitaciones,ciudad)
VALUES(1, 'Decameron Cartagena', 'Calle 23 58-25', '12345678-9', 42,'Cartagena' );