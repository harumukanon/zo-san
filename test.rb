#-*- coding: utf-8 -*-
require 'rubygems'
require "sparql/client"

client = SPARQL::Client.new("http://id.ndl.go.jp/auth/ndla")
results = client.query("
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX rda: <http://RDVocab.info/ElementsGr2/>
    PREFIX foaf: <http://xmlns.com/foaf/0.1/>
    PREFIX xl: <http://www.w3.org/2008/05/skos-xl#>
    PREFIX ndl: <http://ndl.go.jp/dcndl/terms/>
    SELECT * WHERE {
    ?uri1 foaf:primaryTopic ?uri2.
    ?uri1 xl:prefLabel [ xl:literalForm ?heading; ndl:transcription ?yomi ].
    OPTIONAL {
    ?uri2 rda:dateOfBirth ?birth.
    ?uri2 rda:dateOfDeath ?death.
    }
    FILTER (lang(?yomi) = 'ja-Kana').
    FILTER regex(?heading, '^夏目').
    }")

    results.each do |solution|
    puts "#{solution[:uri1]} | #{solution[:uri2]} | #{solution[:birth]} 
    | #{solution[:death]} | #{solution[:heading]} | #{solution[:yomi]}"
    end

