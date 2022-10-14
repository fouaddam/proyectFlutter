

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoflutter/fb_objects/Profil.dart';
import 'package:proyectoflutter/sigelton/DataHolder.dart';

class FBAdmin{



        FBAdmin(){

        }

        FirebaseFirestore db =FirebaseFirestore.instance;
        String sProfilCollection=DataHolder().COLLECTION_PROFILE;


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