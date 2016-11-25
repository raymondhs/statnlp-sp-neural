set -e -x
mkdir -p logs

for lang in $@; do
  prefix=orig
  time java -Xmx144g -Djava.library.path=/usr/local/lib -cp bin/sp.jar com.statnlp.example.sp.main.SemTextExperimenter_Discriminative -thread 16 -lang $lang -optim lbfgs -l2 0.01 -iter 100 -save-iter 50 -sequential-touch -skip-test-extract -save-prefix $prefix > logs/$prefix.$lang.out 2> logs/$prefix.$lang.err
done
