   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:UserInterface.ViewUserInterface.View  5      (    "UserInterface.View.PrijavljujeView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:UserInterface.View     5      .��5	      � .+�5
   
   �� $!��Tabela prijavljenih kvarova��6   $
��Left=�66   $��42��6Q   $��
270,10,0,0q�6]   $	��Top=�6q   $	��273��6�   $
��Bold"�6�   $��20(�6�   �� 5   
   $��Kvarovi��6   $
��Left=�6"   $��42��6=   $��
584,96,0,0q�6I   $	��Top=�6]   $	��156��6u   $
��Bold"�6�   $��20(�6�   �� 5   
   $��
Stanovnici��6   $
��Left=�6%   $��42��6@   $��	14,96,0,0q�6L   $	��Top=�6_   $	��156��6w   $
��Bold"�6�   $��20(�6�   &   System.Windows.Controls.DataGrid  5   
   $
��Left=�6       
IsReadOnly  .    SelectionMode$ Single=�6@      AutoGenerateColumns .  $	��244��6s   $��
221,57,0,0q�6�   $	��Top=�6�   $	��358��6   �� SelectedItem 6�   �� *SelectedPrijavljenKvar+��6�   �� *PrijavljeniKvarovi+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ JMBG Studenta��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6<   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6F   ��  �� Path$ stanuje_student_jmbg�6v     5      $ ID sobe��6%   $ * 66    6@   �� $ stanuje_soba_id_soba�6p     5      $ ID kvara��6%   $ * 67    6A   �� $ kvar_id_kvar�6i   5      �� 5   
   $��Create��6   $
��Left=�6"   $��26��6X   $��
36,344,0,0q�6d   $	��Top=�6x   $	��161��6�   ��6=   �� *Create+6�   �� 5   
   $��Delete��6   $
��Left=�6"   $��26��6X   $��288,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Delete+6�   �� 5   
   $��Update��6   $
��Left=�6"   $��26��6X   $��534,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Update+6�   �� 5   
   $
��Left=�6   $	��158��6.   $��
10,143,0,0q�6�   $	��Top=�6�   $	��206��6�    6;   �� *SelectedStanovnik+��6f   �� $ 
Stanovnici�	 �� View	 5      �� 5      .P�5      �� $
��JMBG��6%   
 �� DisplayMemberBinding
 63   �� $ student_jmbg��� 5      $��Id sobe��6%   
 66   �� $ soba_id_soba�5      5      �� 5   
   $
��Left=�6   $	��158��6.   $��584,143,0,0q�6�   $	��Top=�6�   $	��206��6�    6;   �� *SelectedKvar+��6a   �� $ Kvarovi�	 5       �� 5!      .P�5"      �� $��Id��6%   
 61   �� $ id_kvar��� 5#      $
��Opis��6%   
 63   �� $
 opis�5$      5&      5'      5(      