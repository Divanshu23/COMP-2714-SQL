/* 
	the format of the tree definition file is simple,
	you can find specification in the Tigra Menu documentation at:
	
	http://www.softcomplex.com/products/tigra_tree_menu/docs/index.html#hierarchy
*/

var TREE_ITEMS = 
[
	['Oracle Database 10g Express Edition Tutorial','html/tutorialhome.htm', 
	   ['Using this Tutorial','html/tutorialhome_p2.htm',
		  ['Tutorial Scenario','html/tutorialhome_p3.htm',
            ]
		],
		['Product Overview','html/productovw.htm',
          ],
        ['Installation','html/module1/les01_install_showme.htm'
          ],  		
        ['What to Do First','html/module2/les02_access_whylearnit.htm',
		   ['Creating a New Administration Account','html/module2/les02_creuser01_showme.htm'
             ],
		   ['Creating a New Database User Account','html/module2/les02_creuser02_showme.htm'
             ],
           ['Loading Data','html/module2/les02_import_showme.htm' 
             ]
		 ],
        ['Working with Database Objects','html/module3/les03_dbobj_whylearnit.htm',
            ['Creating Tables','html/module3/les03_cretab_tellme.htm',
                ['Creating Tables Using the Object Browser','html/module3/les03_cretab01_showme.htm'
                ],
				['Creating Tables Using SQL','html/module3/les03_cretab02_showme.htm'
                ],
				['Creating a Copy of a Table','html/module3/les03_cretab03_showme.htm'
                ]
			 ],
            ['Modifying Tables','html/module3/les03_modtab_tellme.htm',
                ['Adding a New Column','html/module3/les03_modtab_showme.htm'
                ]
			 ],
		    ['Managing Constraints','html/module3/les03_mancon01_tellme.htm',
				['Identifying Constraints','html/module3/les03_mancon02_tellme.htm',
                ],
				['Creating Constraints','html/module3/les03_mancon03_tellme.htm',
				   ['Implementing Business Rules','html/module3/les03_mancon_showme.htm'
                    ]
                ]
			 ],
			['Removing Tables','html/module3/les03_remtab_tellme.htm',
                ['Removing a Copy of a Table','html/module3/les03_remtab_showme.htm'
                ]
			 ]
		 ],
		['Accessing Data','html/module4/les04_AccessDatawhylearnit.htm',
            ['Building Queries','html/module4/les04_BuildQ_SQLtellme1.htm'
			 ],
            ['Writing a Basic Query','html/module4/les04_WriteBasicQtellme1.htm',
                ['Retrieving Columns','html/module4/les04_RetrieveColstellme.htm'
                ],
                ['Retrieving Rows','html/module4/les04_RetrieveRowstellme.htm'
                ]
			 ],
            ['Joining Tables','html/module4/les04_Joiningtbswhylearnit.htm',
                ['Creating a Simple Join','html/module4/les04_Joinsimpletellme.htm'
                ],
                ['Using the ON Clause','html/module4/les04_JoinONtellme.htm'
                ],
                ['Qualifying Rows When Joining','html/module4/les04_JoinQualifytellme.htm'
                ],
                ['Joining More Than Two Tables','html/module4/les04_JoinMultipleTblstellme.htm'
                ]
			 ],
            ['Using Functions to Customize Reports','html/module4/les04_Functionswhylearnit.htm',
                ['Using Character Functions','html/module4/les04_FunctionsChartellme1.htm'
                ],
                ['Using Numeric Functions','html/module4/les04_FunctionsNumbertellme.htm'
                ],
                ['Using Date Functions','html/module4/les04_FunctionsDatetellme1.htm'
                ],
                ['Using the NVL Function','html/module4/les04_FunctionsNVLtellme.htm'
                ]
			 ],
            ['Working With Groups of Data','html/module4/les04_Groupswhylearnit.htm',
                ['Using the Grouping Functions','html/module4/les04_Groupstellme1.htm'
                ],
                ['Creating Groups of Output','html/module4/les04_GroupsCreatetellme1.htm'
                ],
                ['Restricting Groups of Output','html/module4/les04_GroupsHavingtellme.htm'
                ]
			 ],
		 ],
		['Manipulating Data','html/module5/les05_man_data01_why_learn_it.htm',
            ['Adding Data','html/module5/les05_ins_tab10_tell_me.htm',
                ['Inserting a Row','html/module5/les05_ins_tab20_tell_me.htm',
				    ['Inserting Rows into the EMPLOYEES Table','html/module5/les05_ins_tab10_show_me.htm'
                     ]
                ],
				['Loading Data','html/module5/les05_ins_tab30_tell_me.htm',
					['Inserting Data From a Spreadsheet','html/module5/les05_ins_tab20_show_me.htm'
                     ],
					['Loading Data From XML','html/module5/les05_ins_tab30_show_me.htm'
                     ]
				 ]
			 ],
            ['Modifying Data','html/module5/les05_upd_rows10_tell_me.htm',
                ['Updating a Row','html/module5/les05_upd_rows10_show_me.htm'
                ],
				['Updating Multiple Rows Using SQL','html/module5/les05_upd_rows20_show_me.htm'
                ],
				['Updating a CLOB Value','html/module5/les05_upd_rows30_show_me.htm'
                ]
			 ],
		    ['Removing Data','html/module5/les05_del_rows10_tell_me.htm',
                ['Deleting a Row','html/module5/les05_del_rows10_show_me.htm'
                ],
				['Unloading Data as XML','html/module5/les05_del_rows20_show_me.htm'
                ]
			 ],
			['Saving or Discarding Changes','html/module5/les05_sav_chg10_tell_me.htm',
                ['Saving Changes','html/module5/les05_sav_chg10_show_me.htm'
                ],
				['Discarding Changes','html/module5/les05_sav_chg20_show_me.htm'
                ]
			 ]
		 ],
        ['Building an Application Using Oracle Application Express (formerly HTML DB)','html/module6/les06_BuildAppwhylearnit.htm',
            ['Saving SQL for Use in Applications','html/module6/les06_ReusingQueryshowme.htm',
			 ],
			['Creating a Report Drill Down','html/module6/les06_CreateReportDDshowme.htm',
			 ],
			['Creating a Tabular Form','html/module6/les06_CreateTabluarFormshowme.htm',
			 ]
		 ],
		['Adding PL/SQL Functionality into an Application','html/module8/les08_plsql_whylearnit.htm',
		 	['Creating a PL/SQL Block','html/module8/les08_cre_block1_tellme.htm'
             ],
			['Creating an Anonymous Block','html/module8/les08_cre_anonymous1_tellme.htm',
			 ],
			['Using Triggers','html/module8/les08_use_triggers_whylearnit.htm',
				['Creating DML Triggers','html/module8/les08_cre_dmltriggers1_tellme.htm'
            	 ],
				['Managing Triggers','html/module8/les08_man_triggers_tellme.htm'
            	 ],
				['Auditing by Using a Trigger','html/module8/les08_audit_trigger1_tellme.htm'
            	 ]
	         ],	
			['Using Procedures and Functions','html/module8/les08_proc_cre_whylearnit.htm',
				['Creating Procedures','html/module8/les08_proc_cre_tellme1.htm'
            	 ],
				['Using Parameters','html/module8/les08_proc_cre_tellme2.htm'
            	 ],
				['Creating Functions','html/module8/les08_func_cre_tellme1.htm'
            	 ],
				['Handling Exceptions','html/module8/les08_except_whylearnit.htm'
            	 ]
	         ],	
			['Using Packages','html/module8/les08_pack_whylearnit.htm',
				['Creating the Package Specification','html/module8/les08_pack_spec_tellme.htm'
            	 ],
				['Creating the Package Body','html/module8/les08_pack_body_tellme.htm'
            	 ],
				['Implementing a Package','html/module8/les08_pack_showme.htm'
            	 ]
	         ]			 	
 	 	 ],
		['Administering and Monitoring the Database','html/module10/les10_admin_why_learn_it.htm',
			 ['Managing Database Settings','html/module10/les10_man_set10_tell_me.htm',
				['Viewing Settings','html/module10/les10_man_set10_show_me.htm'
            	 ]
	         ],		
			 ['Managing Memory','html/module10/les10_man_mem10_tell_me.htm',
				['Changing SGA and PGA Targets','html/module10/les10_man_mem10_show_me.htm'
            	 ]
	         ],
			 ['Managing Tablespaces','html/module10/les10_man_tblspc10_tell_me.htm',
				['Using Tablespaces, Segments and Datafiles','html/module10/les10_man_tblspc20_tell_me.htm'
            	 ],
				['Viewing Tablespaces','html/module10/les10_man_tblspc10_show_me.htm'
            	 ],
				['Freeing Space','html/module10/les10_man_tblspc20_show_me.htm'
            	 ]
	         ],		
			 ['Managing Database User Accounts','html/module10/les10_man_usr10_tell_me.htm',
				['Understanding Schemas, Roles and Privileges','html/module10/les10_man_usr20_tell_me.htm'
            	 ],
				['Altering a Password for a User','html/module10/les10_man_usr10_show_me.htm'
            	 ],
				['Dropping a User','html/module10/les10_man_usr20_show_me.htm'
            	 ]
	         ],		
			 ['Monitoring the Database','html/module10/les10_mon_db10_tell_me.htm',
				['Monitoring Performance Issues','html/module10/les10_mon_db20_tell_me.htm'
            	 ],
				['Viewing Top SQL','html/module10/les10_mon_db10_show_me.htm'
            	 ],
				['Monitoring Sessions','html/module10/les10_mon_db20_show_me.htm'
            	 ],
				['Viewing System Statistics','html/module10/les10_mon_db30_show_me.htm'
            	 ]
	         ],		
         ],
		['Creating a Visual Studio .NET Application','html/module7/les07_vs_whylearnit.htm',
		 	['Installing Oracle Developer Tools for Visual Studio .NET','html/module7/les07_install_showme.htm'
             ],
			['Building the Application','html/module7/les07_bldapp_tellme.htm',
				['Creating a Database Connection','html/module7/les07_dbconn_showme.htm'
	             ],	
			 	['Creating a Table Using the Table Designer','html/module7/les07_crtbl_showme.htm'
            	 ],
			 	['Inserting Data Using the Query Window','html/module7/les07_qrycrview_showme.htm'
            	 ],
				['Generating the OracleDataAdapter Code Automatically','html/module7/les07_crapp_showme.htm'
    	         ],
				['Adding a DataGrid to the Form','html/module7/les07_datagrid_showme.htm'
    	         ],
				['Adding an Update Button','html/module7/les07_button_showme.htm'
    	         ]
			 ],
			['Running the Application','html/module7/les07_run_showme.htm'
             ],
			['Using Stored Procedures','html/module7/les07_storedproc_tellme.htm',
				['Creating a Stored Procedure','html/module7/les07_storedproc_showme.htm'
             	 ]
             ]
 	 	 ],
        ['Creating an Application Using PHP','html/module9/les09_create_app_php_wli.htm',
            ['Getting Started','html/module9/les09_getstart_tm.htm',
			    ['Testing the Apache Web Server','html/module9/les09_test_apache_sm.htm'
             	 ],
				['Configuring User Directories in Apache','html/module9/les09_set_userdir_sm.htm'
             	 ],
				['Installing Zend Core for Oracle','html/module9/les09_install_zc4o_sm.htm'
             	 ],
				['Configuring Error Reporting in Zend Core for Oracle','html/module9/les09_conf_err_rep_sm.htm'
             	 ]
             ],		
			['Creating Database Access Logic','html/module9/les09_create_db_logic_tm.htm',
			    ['Defining Database Connection Properties','html/module9/les09_create_db_conn_prop_tm.htm'
             	 ],
				['Creating Database Connection','html/module9/les09_credb_connect_tm.htm'
             	 ],
				['Creating a Generic Query Function','html/module9/les09_cregen_query_tm.htm'
             	 ]
             ],		
			['Creating the User Interface','html/module9/les09_cre_ui_tm.htm',
			    ['Displaying Departments','html/module9/les09_disp_dept_tm.htm'
             	 ],
				['Displaying Employees','html/module9/les09_disp_emp_tm.htm'
             	 ]
             ],	
			['Creating the Control Logic','html/module9/les09_crectl_logic_tm.htm',
			    ['Handling Requests','html/module9/les09_page_handling_tm.htm'
				 ],
				['Logging In','html/module9/les09_login_page_tm.htm'
             	 ],
				['Logging Out','html/module9/les09_logout_page_tm.htm'
             	 ],
				['Getting Department Information','html/module9/les09_get_dept_tm.htm'
             	 ],
				['Getting Employee Information','html/module9/les09_get_emp_tm.htm'
             	 ]
			 ],
			['Running the PHP Application','html/module9/les09_run_php_app_sm.htm'
             ]		
		],
		
  	['Summary','html/tutorialsummary.htm'
  	 ]
   ]
];