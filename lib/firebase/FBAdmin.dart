

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

import '../fb_objects/RoomsPhotoCard.dart';

class FBAdmin{



        FBAdmin(){

        }

        FirebaseFirestore db =FirebaseFirestore.instance;
        String sProfilCollection=DataHolder().COLLECTION_PROFILE;
        List<Room2>listaRommsC=[];


        Future<List<Room2>>? Descargar_Room2() async {

          final ref = db.collection("/rooms").withConverter(
            fromFirestore: Room2.fromFirestore,
            toFirestore: (Room2 room2, _) => room2.toFirestore(),
          );
          final docSnap = await ref.get();
          final docs= docSnap.docs;

          for(int i=0;i<docs.length;i++){
                listaRommsC.add(docs[i].data());
                         }

          return listaRommsC;
        }



        Future<Profil?> Descargar_Perfil(String? sUidUSer) async {

          final ref = db.collection(sProfilCollection).doc(sUidUSer).withConverter(
            fromFirestore: Profil.fromFirestore,
            toFirestore: (Profil profil, _) => profil.toFirestore(),
          );
          final docSnap = await ref.get();
          final profil = docSnap.data(); // Convert to City object
          return profil;

        }








}