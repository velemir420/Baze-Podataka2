using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class PrijavljujeViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }

        private List<kvar> kvarovi = new List<kvar>();
        private kvar selectedKvar;
        private List<stanuje> stanovnici = new List<stanuje>();
        private stanuje selectedStanovnik;
        private List<prijavljuje> prijavljeniKvarovi = new List<prijavljuje>();
        private prijavljuje selectedPrijavljenKvar;


        public PrijavljujeViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                Kvarovi = db.kvars.ToList();
                Stanovnici = db.stanujes.ToList();
                PrijavljeniKvarovi = db.prijavljujes.ToList();
            }
        }
        public List<kvar> Kvarovi
        {
            get
            {
                return kvarovi;
            }
            set
            {
                kvarovi = value;
                OnPropertyChanged("Kvarovi");
            }
        }
        public List<stanuje> Stanovnici
        {
            get
            {
                return stanovnici;
            }
            set
            {
                stanovnici = value;
                OnPropertyChanged("Stanovnici");
            }
        }
        public List<prijavljuje> PrijavljeniKvarovi
        {
            get
            {
                return prijavljeniKvarovi;
            }
            set
            {
                prijavljeniKvarovi = value;
                OnPropertyChanged("PrijavljeniKvarovi");
            }
        }

        public kvar SelectedKvar
        {
            get
            {
                return selectedKvar;
            }
            set
            {
                selectedKvar = value;
                OnPropertyChanged("SelectedKvar");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        public stanuje SelectedStanovnik
        {
            get
            {
                return selectedStanovnik;
            }
            set
            {
                selectedStanovnik = value;
                OnPropertyChanged("SelectedStanovnik");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }
        public prijavljuje SelectedPrijavljenKvar
        {
            get
            {
                return selectedPrijavljenKvar;
            }
            set
            {
                selectedPrijavljenKvar = value;
                OnPropertyChanged("SelectedPrijavljeniKvar");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        private bool CanUpdate()
        {
            //if (SelectedKvar != null && SelectedStanovnik != null && SelectedPrijavljenKvar != null)
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
            if (SelectedPrijavljenKvar != null)
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
            if (SelectedKvar != null && SelectedStanovnik != null)
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

            }
        }

        private void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                string jmbg = SelectedPrijavljenKvar.stanuje_student_jmbg;
                int id_sobe = SelectedPrijavljenKvar.stanuje_soba_id_soba;
                int id_kvar = SelectedPrijavljenKvar.kvar_id_kvar;
                prijavljuje pr = db.prijavljujes.Where(x => x.stanuje_soba_id_soba == id_sobe && x.kvar_id_kvar == id_kvar && String.Equals(jmbg, x.stanuje_student_jmbg)).FirstOrDefault();

                if (pr != null)
                {
                    db.prijavljujes.Remove(pr);
                    db.SaveChanges();
                    MessageBox.Show("Uspesno ste obrisali entitet");
                    PrijavljeniKvarovi = db.prijavljujes.ToList();
                }
                else
                {
                    MessageBox.Show("Neuspesno brisanje entiteta iz tabele");
                }
            }
        }

        private void OnCreate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                string jmbg = SelectedStanovnik.student_jmbg;
                int id_sobe = SelectedStanovnik.soba_id_soba;
                int id_kvar = SelectedKvar.id_kvar;
                prijavljuje pr = db.prijavljujes.Where(x => x.stanuje_soba_id_soba == id_sobe && x.kvar_id_kvar == id_kvar && String.Equals(jmbg, x.stanuje_student_jmbg)).FirstOrDefault();

                if (pr == null)
                {
                    db.prijavljujes.Add(new prijavljuje() { stanuje_soba_id_soba = id_sobe, kvar_id_kvar = id_kvar, stanuje_student_jmbg = jmbg});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno ste uneli entitet");
                    PrijavljeniKvarovi = db.prijavljujes.ToList();
                }
                else
                {
                    MessageBox.Show("Uneti entitet je vec u bazi podataka");
                }
            }
        }
    }
}
