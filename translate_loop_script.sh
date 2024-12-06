for ((i = 3 ; i < 25 ; i = i + 3 )); do 
    SECONDS=0
    python translate_beam.py --data data/en-fr/prepared --dicts data/en-fr/prepared --checkpoint-path assignments/03/baseline/checkpoints/checkpoint_best.pt --output assignments/03/baseline/translations.txt --beam-size $i > /dev/null 2>&1
    echo "TIME: $SECONDS"
    bash scripts/postprocess.sh assignments/03/baseline/translations.txt assignments/03/baseline/translations.p.txt en
    cat assignments/03/baseline/translations.p.txt | sacrebleu data/en-fr/raw/test.en > scores/score_$i.txt
done