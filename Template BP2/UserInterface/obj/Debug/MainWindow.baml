   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:UserInterfaceUserInterface  5   	   7 clr-namespace:UserInterface.ViewUserInterface.View  5   	   A%clr-namespace:UserInterface.ViewModelUserInterface.ViewModel  5   	       UserInterface.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:UserInterface     5   	   2views clr-namespace:UserInterface.View     5   	   ;	viewModel%clr-namespace:UserInterface.ViewModel     5   	     � Title$  
MainWindow��5
   	   $	��480��6   $	��830��6)    � DataContext 5      1   +UserInterface.ViewModel.MainWindowViewModel  5   
    � 	Resources 5       �� DataType4   .UserInterface.ViewModel.StudentskiDomViewModel*   $UserInterface.View.StudentskiDomView.   (UserInterface.ViewModel.StudentViewModel$   UserInterface.View.StudentView+   %UserInterface.ViewModel.SobaViewModel!   UserInterface.View.SobaView.   (UserInterface.ViewModel.StanujeViewModel$	   UserInterface.View.StanujeView2
   ,UserInterface.ViewModel.PrijavljujeViewModel(   "UserInterface.View.PrijavljujeView,   &UserInterface.ViewModel.DomarViewModel"   UserInterface.View.DomarView+   %UserInterface.ViewModel.KvarViewModel!   UserInterface.View.KvarView��%  (��       5      *, +)(�� 2     5      *, +)(�� d     5      *, +)(�� �     5      *, +)(�� �     5      *,
 +)(�� �     5      *, +)(�� ,    5!      *, +)�� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5      	  5      �� 5   
   " 
 6   .R�5        5      �� 5   
   "  6   .R�5        5       �� 5!   
   "  6   .R�5"        5#      5$      .��5%      �  � RowDefinitions 5&   
   �� 5'      $
��Auto �6   �� 5(      $
��Auto �6   .+�5*   
   ]� $��0��6   $��5q�6!   .+�5+      o� $	��Top=�6   $��30��6(   .@�5,      m� $��Studentski dom��6    m� CommandParameter$	 dom��5-      $��30��62    m� Command 5,   3   �� *
NavCommand+5-   2   m� 5.      $
��Soba��6   $
 soba��5/       5.   )   �� *
NavCommand+5/      m� 50      $��Student��6   $ student��51       50   ,   �� *
NavCommand+51      m� 52      $��Stanuje��6   $ stanuje��53       52   ,   �� *
NavCommand+53      m� 54      $��Prijavljuje��6   $ prijavljuje��55       54   0   �� *
NavCommand+55      m� 56      $��Domar��6   $ domar��57       56   *   �� *
NavCommand+57      m� 58      $
��Kvar��6   $
 kvar��59       58   )   �� *
NavCommand+59      5:      5;      � 5<   
   $��1��6   .+�5=      �� ��6   �� *CurrentViewModel+5>      5?      5@      