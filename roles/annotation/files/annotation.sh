#!/bin/bash
java -cp /data/annotation/annotation.jar org.forome.annotation.annotator.main.AnnotatorMainFork -config /data/annotation/config.json -inventory $1 $(@:2)