
class Meterlesings{


final String m_Id;

final String takkode;
final String straat_adres;
final String maand;
final String datum_ingelees ;
final String personeel_nom ;
final String aktief ;


const Meterlesings({

required this.m_Id,
required this.takkode,
required this.straat_adres,
required this.maand,
required this.datum_ingelees,
required this.personeel_nom,
required this.aktief, 
});

Meterlesings copy({

String? m_Id,
String? takkode,
String? straat_adres,
String? maand,
String? datum_ingelees,
String? personeel_nom,
String? aktief,


  
}) => 

Meterlesings(m_Id: m_Id ?? this.m_Id,
  takkode: takkode ?? this.takkode,
 straat_adres: straat_adres ?? this.straat_adres,
  maand: maand ?? this.maand,
   datum_ingelees: datum_ingelees ?? this.datum_ingelees,
    personeel_nom: personeel_nom ?? this.personeel_nom,
     aktief: aktief ?? this.aktief);


}