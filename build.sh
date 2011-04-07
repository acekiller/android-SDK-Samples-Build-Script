# for each platform sample list
for platform in android*
 
do
 
  cd $platform
 
  for prj in *
  do
    if cd $prj   # weird hack:  need a better way to test if we are in a directory.  We are cd'ing in, then cd'ing out :|
      then
        cat AndroidManifest.xml | grep package=
        cd ..
        echo "$platform/$prj"
 
 
        android update project --subprojects -p $prj -n $prj -t $platform
        cd $prj
        ant debug
        cd ..
 
        echo ""
        echo "***************************************************************"
        echo ""
        echo ""
    fi
 
 
 
  done
  cd ..
  pwd
done
