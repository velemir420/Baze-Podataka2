using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class StanujeViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }
        private List<student> studenti = new List<student>();
        private student selectedStudent;
        private List<soba> sobe = new List<soba>();
        private soba selectedSoba;
        private List<stanuje> stanujes = new List<stanuje>();
        private stanuje selectedStanuje;

        public StanujeViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                Studenti = db.students.ToList();
                Sobe = db.sobas.ToList();
                Stanujes = db.stanujes.ToList();
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
        public List<soba> Sobe
        {
            get
            {
                return sobe;
            }
            set
            {
                sobe = value;
                OnPropertyChanged("Sobe");
            }
        }
        public List<stanuje> Stanujes
        {
            get
            {
                return stanujes;
            }
            set
            {
                stanujes = value;
                OnPropertyChanged("Stanujes");
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
                OnPropertyChanged("SelectedStudent");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }
        public soba SelectedSoba
        {
            get
            {
                return selectedSoba;
            }
            set
            {
                selectedSoba = value;
                OnPropertyChanged("SelectedSoba");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }
        public stanuje SelectedStanuje
        {
            get
            {
                return selectedStanuje;
            }
            set
            {
                selectedStanuje = value;
                OnPropertyChanged("SelectedStanuje");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        private bool CanUpdate()
        {
            //if (SelectedStanuje != null && SelectedSoba != null && SelectedStudent != null)
            //{
            //    return true;
            //}
            //else
            //{
            //    return false;
            //}
            return false;
        }

        private bool CanDelete()
        {
            if (SelectedStanuje != null)
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
            if (SelectedSoba != null && SelectedStudent != null)
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
                stanuje st = db.stanujes.Where(x => (x.soba_id_soba == SelectedStanuje.soba_id_soba && String.Equals(x.student_jmbg, SelectedStanuje.student_jmbg))).FirstOrDefault();
                stanuje st1 = db.stanujes.Where(x => (x.soba_id_soba == SelectedSoba.id_soba && String.Equals(x.student_jmbg, SelectedStudent.jmbg))).FirstOrDefault();

                if (st != null)
                {
                    if (st1 == null) {
                        st.soba_id_soba = SelectedSoba.id_soba;
                        st.student_jmbg = SelectedStudent.jmbg;
                        db.SaveChanges();
                        MessageBox.Show("Uspesno izmenjen entitet u bazi");
                        Stanujes = db.stanujes.ToList();
                    }
                    else
                    {
                        MessageBox.Show("Nemoguce izmeniti entiten, uneti entitet vec postoji u bazi podataka");
                    }
                }
                else
                {
                    MessageBox.Show("Uneti entitet ne postoji u bazi podataka");
                }
            }
        }

        private void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                try
                {
                    stanuje st = db.stanujes.Where(x => (x.soba_id_soba == SelectedStanuje.soba_id_soba && String.Equals(x.student_jmbg, SelectedStanuje.student_jmbg))).FirstOrDefault();

                    if (st != null)
                    {
                        db.stanujes.Remove(st);
                        db.SaveChanges();
                        MessageBox.Show("Uspesno obrisan entitet iz bazu");
                        Stanujes = db.stanujes.ToList();
                    }
                    else
                    {
                        MessageBox.Show("Uneti entitet ne postoji u bazi podataka");
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
                stanuje st = db.stanujes.Where(x=>(x.soba_id_soba == SelectedSoba.id_soba && String.Equals(x.student_jmbg, SelectedStudent.jmbg))).FirstOrDefault();

                if (st == null)
                {
                    db.stanujes.Add(new stanuje() { soba_id_soba = SelectedSoba.id_soba, student_jmbg = SelectedStudent.jmbg});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno dodat entitet u bazu");
                    Stanujes = db.stanujes.ToList();
                }
                else
                {
                    MessageBox.Show("Uneti entitet vec postoji u bazi podataka");
                }
            }
        }
    }
}
