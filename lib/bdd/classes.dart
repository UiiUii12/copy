
class Plat{
  final String id, resId,descreption,nom,categore;
  final int prix;
  Plat({required this.id,required this.nom,required this.resId,required this.descreption,required this.prix,required this.categore});
}
class Panier{
  final String id, resId,descreption,nom,categore,message;
  final int prix,quantite;
  Panier({required this.id,required this.nom,required this.resId,required this.descreption,required this.prix,required this.categore,required this.quantite,required this.message});
}
class MaCommande{
  final String id , nom;
  final String date,etat ;

  final int voscommande, livraison, total;
  MaCommande({required this.id, required this.date, required this.livraison, required this.total, required this.voscommande, required this.etat , required this.nom});

}
class Maplat{
  final String descreption,nom;
  final int prix,quantite;
  Maplat({required this.nom,required this.descreption,required this.prix,required this.quantite});
}
class cat {
  final String id;
  final String nom;
  cat({required this.id, required this.nom});
}