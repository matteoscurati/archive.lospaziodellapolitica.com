$(document).ready( () => {
  const articleList = new List('articles', {
    valueNames : [
      'name',
      'date',
      'title'
    ],
    plugins: [ ListFuzzySearch() ]
  });

  const authorList = new List('authors', {
    valueNames : [
      'name',
      'count'
    ],
    plugins: [ ListFuzzySearch() ]
  });
});
