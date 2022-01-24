#/bi/bash

echo "outputs: "
for i in `seq 1 $1`; do
    for j in `seq 1 $2`; do
        echo "  dbconnection_${i}_${j}: \${{ steps.dbconnection.outputs.dbconnection_${i}_${j}}}"          
    done
done
echo "  x: \${{ steps.generate-matrix.outputs.x }}"
echo "  y: \${{ steps.generate-matrix.outputs.y }}"