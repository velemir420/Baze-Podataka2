ALTER TABLE stanuje
    ADD CONSTRAINT stanuje_student_fk FOREIGN KEY ( student_jmbg )
        REFERENCES student ( jmbg );
