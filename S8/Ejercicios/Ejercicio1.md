```json
[
  {
    '$unwind': {
      'path': '$countries', 
      'preserveNullAndEmptyArrays': false
    }
  }, {
    '$unwind': {
      'path': '$genres', 
      'preserveNullAndEmptyArrays': false
    }
  }, {
    '$group': {
      '_id': '$countries', 
      'total_peliculas': {
        '$sum': 1
      }, 
      'pelicula_genero': {
        '$push': {
          'genero': '$genres'
        }
      }
    }
  }, {
    '$unwind': {
      'path': '$pelicula_genero', 
      'preserveNullAndEmptyArrays': false
    }
  }, {
    '$group': {
      '_id': {
        'genero': '$pelicula_genero.genero', 
        'pais': '$_id'
      }, 
      'total': {
        '$sum': 1
      }
    }
  }, {
    '$addFields': {
      'pais': '$_id.pais', 
      'genero': '$_id.genero'
    }
  }, {
    '$project': {
      '_id': 0, 
      'total': 1, 
      'pais': 1, 
      'genero': 1
    }
  }
]
```