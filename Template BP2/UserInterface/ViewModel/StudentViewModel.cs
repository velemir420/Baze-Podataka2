using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class StudentViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }
        private List<student> studenti = new List<student>();
        private student selectedStudent;
        private string jmbg;
        private string ime;
        private string prezime;


        public string JMBG
        {
            get
            {
                return jmbg;
            }
            set
            {
                jmbg = value;
                OnPropertyChanged("JMBG");
                Create.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
            }
        }
        public string Ime
        {
            get
            {
                return ime;
            }
            set
            {
                ime = value;
                OnPropertyChanged("Ime");
                Create.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
            }
        }

        public string Prezime
        {
            get
            {
                return prezime;
            }
            set
            {
                prezime = value;
                OnPropertyChanged("Prezime");
                Create.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
            }
        }

        public StudentViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                Studenti = db.students.ToList();
            }
        }

        public student SelectedStudent
        {
            get
            {
                return selectedStudent;
            }
            set
            {
                selectedStudent = value;
                if (value != null)
                {
                    JMBG = value.jmbg;
                    Ime = value.ime;
                    Prezime = value.prezime;
                }
                OnPropertyChanged("SelectedStudent");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
            }
        }
        public List<student> Studenti
        {
            get
            {
                return studenti;
            }
            set
            {
                studenti = value;
                OnPropertyChanged("Studenti");
            }
        }

        private bool CanUpdate()
        {
            if (!String.IsNullOrEmpty(JMBG) && !String.IsNullOrEmpty(Ime) && !String.IsNullOrEmpty(Prezime) && SelectedStudent != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool CanDelete()
        {
            if (SelectedStudent != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool CanCreate()
        {
            if (!String.IsNullOrEmpty(JMBG) && !String.IsNullOrEmpty(Ime) && !String.IsNullOrEmpty(Prezime))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void OnUpdate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                student st = db.students.Where(x => String.Equals(x.jmbg, SelectedStudent.jmbg)).FirstOrDefault();

                if (st != null)
                {
                    st.ime = Ime;
                    st.prezime = Prezime;

                    db.SaveChanges();
                    MessageBox.Show("Uspesno su izmenjeni podaci u bazi");
                    Studenti = db.students.ToList();
                }
                else
                {
                    MessageBox.Show("Student sa unetim ID-om vec postoji u bazi podataka");
                }
            }
        }

        private void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                try
                {
                    student st = db.students.Where(x => String.Equals(x.jmbg, SelectedStudent.jmbg)).FirstOrDefault();

                    if (st != null)
                    {
                        db.students.Remove(st);
                        db.SaveChanges();
                        MessageBox.Show("Uspesno je obrisan student iz bazu");
                        Studenti = db.students.ToList();
                    }
                    else
                    {
                        MessageBox.Show("Student sa unetim ID-om ne postoji u bazi podataka");
                    }
                }
                catch
                {
                    MessageBox.Show("Greska pri brisanju odabranog entiteta");
                }
            }
        }

        private void OnCreate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                student st = db.students.Where(x => String.Equals(x.jmbg, JMBG)).FirstOrDefault();

                if (st == null)
                {
                    db.students.Add(new student() { jmbg = JMBG, ime = Ime, prezime = Prezime});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno je dodat student u bazu");
                    Studenti = db.students.ToList();
                }
                else
                {
                    MessageBox.Show("Student sa unetim ID-om vec postoji u bazi");
                }
            }
        }
    }
}
