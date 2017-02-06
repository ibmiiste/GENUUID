     ?*****************************************************************
     ?* PROGRAMME :?GENUUID                ?DATE CREATION : 22/07/2016
     ?* AUTEUR    : O.Drubigny
     ?*----------------------------------------------------------------
     ?* APPLICATION : THERMOS
     ?*----------------------------------------------------------------
     ?* DESCRIPTION :Génération de l'identifiant unique (UUID)
     ?*
     ?*----------------------------------------------------------------
     ?* MAINTENANCE :
     ?*
     ?* N°     AUTEUR         DESCRIPTION DE LA MODIF            DATE
     ?* ... ............  .................................  ../../....
     ?*----------------------------------------------------------------
     H Nomain
     H option(*SrcStmt : *nodebugio)
     H*bnddir('QC2LE') dftactgrp(*no) actgrp('QILE')
      *
     P GENUUID         B                   export
      *
     D GENUUID         pi            32a
      *
     D UUIDTemplate    ds
     D   Bytes_in                    10U 0
     D   Bytes_out                   10U 0
     D   Reserved                     8a   inz(x'0000000000000000')
     D   UUID                        16a

     D RtvUuid         pr                  ExtProc('_GENUUID')
     D  UUID_Template                  *   Value
      *
     D UUID_String     s             32a

                         RtvUuid( %Addr(UUIDTemplate));
                         //?Conversion de la valeur genérée en hexadecimal
                         Exec sql
                         SET :UUID_String = HEX(:UUID);
                         Return UUID_String;
     P GENUUID         E

