﻿ALTER TABLE menza
    ADD CONSTRAINT menza_stud_centar_fk FOREIGN KEY ( stud_centar_id_stud_centar )
        REFERENCES stud_centar ( id_stud_centar );