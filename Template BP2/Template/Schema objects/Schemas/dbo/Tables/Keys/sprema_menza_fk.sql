ALTER TABLE sprema
    ADD CONSTRAINT sprema_menza_fk FOREIGN KEY ( menza_id_menza )
        REFERENCES menza ( id_menza );
