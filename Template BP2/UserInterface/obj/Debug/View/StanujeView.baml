   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:UserInterface.ViewUserInterface.View  5      $    UserInterface.View.StanujeView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:UserInterface.View     5      .��5	      � .+�5
   
   �� $��Tabela stanuje��6   $
��Left=�6)   $��42��6D   $��
270,10,0,0q�6P   $	��Top=�6d   $	��207��6|   $
��Bold"�6�   $��20(�6�   �� 5   
   $
��Sobe��6   $
��Left=�6   $��42��6:   $��
584,96,0,0q�6F   $	��Top=�6Z   $	��156��6r   $
��Bold"�6~   $��20(�6�   �� 5   
   $��Studenti��6   $
��Left=�6#   $��42��6>   $��	14,96,0,0q�6J   $	��Top=�6]   $	��156��6u   $
��Bold"�6�   $��20(�6�   &   System.Windows.Controls.DataGrid  5   
   $
��Left=�6       
IsReadOnly  .    SelectionMode$ Single=�6@      AutoGenerateColumns .  $	��244��6s   $��
221,57,0,0q�6�   $	��Top=�6�   $	��358��6�    �� SelectedItem 6�   �� *SelectedStanuje+��6�   �� *
Stanujes+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ JMBG Studenta��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6<   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6F   ��  �� Path$ student_jmbg�6n     5      $ ID sobe��6%   $ * 66    6@   �� $ soba_id_soba�6h   5      �� 5   
   $��Create��6   $
��Left=�6"   $��26��6X   $��
36,344,0,0q�6d   $	��Top=�6x   $	��161��6�   ��6=   �� *Create+6�   �� 5   
   $��Delete��6   $
��Left=�6"   $��26��6X   $��288,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Delete+6�   �� 5   
   $��Update��6   $
��Left=�6"   $��26��6X   $��534,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Update+6�   �� 5   
   $
��Left=�6   $	��158��6.   $��
10,143,0,0q�6�   $	��Top=�6�   $	��206��6�    6;   �� *SelectedStudent+��6d   �� $ Studenti�	 �� View	 5      �� 5      .P�5      �� $
��JMBG��6%   
 �� DisplayMemberBinding
 63   �� $
 jmbg��� 5      $	��Ime��6%   
 62   �� $	 ime��� 5      $��Prezime��6%   
 66   �� $ prezime�5      5      �� 5   
   $
��Left=�6   $	��158��6.   $��584,143,0,0q�6�   $	��Top=�6�   $	��206��6�    6;   �� *SelectedSoba+��6a   �� $
 Sobe�	 5       �� 5!      .P�5"      �� $��Id��6%   
 61   �� $ id_soba��� 5#      $
��Broj��6%   
 63   �� $
 broj�5$      5&      5'      5(      