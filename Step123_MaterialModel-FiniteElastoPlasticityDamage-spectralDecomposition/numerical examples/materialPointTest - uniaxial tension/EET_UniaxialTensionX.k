$# LS-DYNA Keyword file created by LS-PrePost(R) V4.7.20 -24Aug2020
$# Created on Sep-23-2022 (08:22:35)
$*KEYWORD
*TITLE
$#                                                                         title
LS-DYNA keyword deck by LS-PrePost
*BOUNDARY_PRESCRIBED_MOTION_SET_ID
$#      id                                                               heading
         0Zug-1R_x
$#    nsid       dof       vad      lcid        sf       vid     death     birth
         1         1         2         1       1.0         01.00000E28       0.0
*ELEMENT_SOLID
$#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8
       1       1       1       2       4       3       5       6       8       7
*NODE
$#   nid               x               y               z      tc      rc  
       1             0.0             0.0             0.0       0       0
       2             1.0             0.0             0.0       0       0
       3             0.0             1.0             0.0       0       0
       4             1.0             1.0             0.0       0       0
       5             0.0             0.0             1.0       0       0
       6             1.0             0.0             1.0       0       0
       7             0.0             1.0             1.0       0       0
       8             1.0             1.0             1.0       0       0
*PART
$#                                                                         title
Zug-1R
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         1         1      &MID         0         0         0         0     &TMID
*SET_NODE_LIST_TITLE
Nset_displ_x-R1
$#     sid       da1       da2       da3       da4    solver      
         1       0.0       0.0       0.0       0.0MECH
$#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8
         6         8         2         4         0         0         0         0
*SET_NODE_LIST_TITLE
NodeSet_bottom_z-
$#     sid       da1       da2       da3       da4    solver      
        13       0.0       0.0       0.0       0.0MECH
$#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8
         1         2         3         4         0         0         0         0
*BOUNDARY_SPC_SET
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
        13         0         0         0         1         0         0         0
*SET_NODE_LIST_TITLE
NodeSet_bottom_y-
$#     sid       da1       da2       da3       da4    solver      
        12       0.0       0.0       0.0       0.0MECH
$#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8
         1         2         5         6         0         0         0         0
*BOUNDARY_SPC_SET
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
        12         0         0         1         0         0         0         0
*SET_NODE_LIST_TITLE
NodeSet_bottom_x-
$#     sid       da1       da2       da3       da4    solver      
        11       0.0       0.0       0.0       0.0MECH
$#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8
         1         3         5         7         0         0         0         0
*BOUNDARY_SPC_SET
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
        11         0         1         0         0         0         0         0
$*END
