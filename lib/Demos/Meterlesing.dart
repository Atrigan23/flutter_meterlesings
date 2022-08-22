class Meterlesing {

 String m_Id;
 String takkode;
 String straat_adres;
 String maand;
 String datum_ingelees ;
 String personeel_nom ;
 String aktief ;

 Meterlesing({

required this.m_Id,
required this.takkode,
required this.straat_adres,
required this.maand,
required this.datum_ingelees,
required this.personeel_nom,
required this.aktief, 
});

factory Meterlesing.fromJson(Map<String, dynamic> json) {
  String Id = json['m_Id'].toString();
    return Meterlesing(
        m_Id: Id,
        takkode: json['takkode'] as String,
        straat_adres: json['straat_adres'] as String,
        maand: json['maand'] as String,
        datum_ingelees: json['datum_ingelees'] as String,
        personeel_nom: json['personeel_nom'] as String,
        aktief: json['aktief'] as String,
        
        
        
        );
  }


}