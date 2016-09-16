#!/bin/bash
mysql --local-infile --user=root --password=rootpass  <<STOP
drop database if exists weatherdb;
create database if not exists weatherdb;
use weatherdb;
create table metar (icao Varchar(4), time Varchar(16), report Varchar(250));
STOP
