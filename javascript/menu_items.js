/*
  --- menu items --- 
  note that this structure has changed its format since previous version.
  additional third parameter is added for item scope settings.
  Now this structure is compatible with Tigra Menu GOLD.
  Format description can be found in product documentation.
*/
var MENU_ITEMS = [
	['Αρχική σελίδα', 'index.jsp'
	],
	['Καταχώρηση', 'Anazitisi.jsp', null,
		['Αίτησης', "Anazitisi.jsp?type='aitisi'"],
		['Ελέγχου', "Anazitisi.jsp?type='elegchos'"]
		
	],
	['Διαχείριση', 'Anazitisi.jsp', null,
		['Χρηστών', 'DiacheirisiChriston.jsp'],
		['Λεκτικών', null, null,
			['Υπηρεσιακές μεταβολές', 'DiacheirisiYpirMetavoles.jsp'],
			['Οικογενειακές καταστάσεις', 'DiacheirisiOikogKatastaseis.jsp'],
			['Δ.Ο.Υ.', 'DiacheirisiDoy.jsp']
		]
	],
	['Επικοινωνία', null, null,
		['Τηλ. 2106988403'],
		['FAX: 2106919292'],
		['email: xpetsioy@ermis.ydt']
	],
	['HelpMenu', null, null,
		['H1'],
		['H2'],
		['H3']
	]

];

