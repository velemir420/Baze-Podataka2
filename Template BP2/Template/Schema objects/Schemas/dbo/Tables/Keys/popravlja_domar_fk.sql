ALTER TABLE popravlja
    ADD CONSTRAINT popravlja_domar_fk FOREIGN KEY ( domar_id_radnik )
        REFERENCES domar ( id_radnik );