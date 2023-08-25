# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Cat.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('cats')

cat = Cat.create([{birth_date: '2020/08/11', color: 'grey', name: 'Eric', sex: 'M', description: 'a fond cat with long whiskers'},
{birth_date: '2017/06/23', color: 'black', name: 'Krikor', sex: 'M', description: 'a grumpy cat'},
{birth_date: '2021/01/01', color: 'white', name: 'Davis', sex: 'M', description: 'loves blankets'},
{birth_date: '2014/03/30', color: 'grey', name: 'Queen', sex: 'F', description: 'likes strolls in the park'},
{birth_date: '2019/06/04', color: 'orange', name: 'Shannon', sex: 'F', description: 'enjoys playing with yarn'}])