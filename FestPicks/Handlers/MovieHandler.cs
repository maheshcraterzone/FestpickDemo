using FestPicks.DataLayer;
using FestPicks.Models;
using LinqKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Text;

namespace FestPicks.Handlers
{
    public class MovieHandler
    {
        #region Constants
        private const int MAXIMUM_ROWS = 20;
        private const string WINNER = "Winner";
        private const string PREVIOUS_YEAR = "2015";
        #endregion

        /// <summary>
        /// Get the details of the movie by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MovieWithFestivalDetails GetMovieDetailsById(int id)
        {
            MovieWithFestivalDetails completeMovieDetails = null;
            using (var repo = new filmfestivaldbEntities())
            {
                var movie = repo.moviesdetails.Join(repo.festivaldetails, m => m.festival_id, f => f.Id, (m, f) => new { m, f })
                                                   .Where(x => x.m.Id == id)
                                                   .Select(y => new
                                                   {
                                                       About = y.m.Description,
                                                       Actors = y.m.Actors,
                                                       Award = y.m.Award,
                                                       Director = y.m.Director,
                                                       Festival = y.m.FestivalFullName,
                                                       FestivalBannerUrl = y.f.FestivalArtUrl,
                                                       Id = y.m.Id,
                                                       Location = y.m.Country,
                                                       MovieLink = y.m.MovieLink,
                                                       Name = y.m.Title,
                                                       PosterUrl = y.m.PosterLink,
                                                       ReleasingDate = y.m.Released,
                                                       RunningTime = y.m.Runtime,
                                                       YoutubeLink = y.m.YoutubeEmbeddedCode,
                                                       AmazonLinkRent = y.m.AmazonLinkRent
                                                   }).FirstOrDefault();
                if (movie != null)
                {
                    completeMovieDetails = new MovieWithFestivalDetails();
                    // Convert the bytes array into string and store into about 
                    completeMovieDetails.About = System.Text.Encoding.Default.GetString(movie.About);
                    completeMovieDetails.Actors = movie.Actors;
                    completeMovieDetails.Award = movie.Award;
                    completeMovieDetails.Director = movie.Director;
                    completeMovieDetails.Festival = movie.Festival;
                    completeMovieDetails.Id = movie.Id;
                    completeMovieDetails.Location = movie.Location;
                    completeMovieDetails.Name = movie.Name;
                    completeMovieDetails.PosterUrl = movie.PosterUrl;
                    completeMovieDetails.ReleasingDate = movie.ReleasingDate;
                    completeMovieDetails.RunningTime = movie.RunningTime;
                    completeMovieDetails.MovieLink = movie.MovieLink;
                    completeMovieDetails.FestivalBannerUrl = movie.FestivalBannerUrl;
                    completeMovieDetails.AmazonLinkRent = movie.AmazonLinkRent;
                    // Convert the bytes array into string and store into YoutubeEmbedded Link url
                    completeMovieDetails.YoutubeEmbeddedLink = System.Text.Encoding.Default.GetString(movie.YoutubeLink);
                }
                return completeMovieDetails;
            }
        }

        /// <summary>
        /// Get the award winner movies of previous year by festival name
        /// </summary>
        /// <param name="festivalname"></param>
        /// <returns></returns>
        public List<MovieModel> GetAllMoviesByFestivalName(string festivalname, int incrementIndex)
        {
            List<MovieModel> movielist = new List<MovieModel>();
            byte[] empty = { };
            //using (var repo = new filmfestivaldbEntities())
            //{
            //    var list = from t in repo.moviesdetails
            //               where t.FestivalFullName == festivalname
            //               && t.Title != ""
            //               && t.PosterLink != ""
            //               && t.YoutubeEmbeddedCode != empty
            //               && t.DisplayFilm == true
            //               group t by t.Title into g
            //               select g.FirstOrDefault();

            //    foreach (var obj in list)
            //    {
            //        movielist.Add(new MovieModel() { Id = obj.Id, Actors = obj.Actors, Award = obj.Award, Director = obj.Director, Festival = obj.FestivalFullName, Name = obj.Title, ReleasingDate = obj.Released, PosterUrl = obj.PosterLink, RunningTime = obj.Runtime });
            //    }
            //}
            using (var repo = new filmfestivaldbEntities())
            {
                var list = repo.moviesdetails.Where(x => x.FestivalFullName == festivalname
                                                            && x.Title != ""
                                                            && x.PosterLink != ""
                                                            && x.YoutubeEmbeddedCode != empty
                                                            && x.DisplayFilm == true
                                                            )
                                                            .ToList();

                list = list.GroupBy(g => g.Title)
                           .Select(s => s.FirstOrDefault())
                           .OrderBy(o => o.Id)
                           .Skip(MAXIMUM_ROWS * incrementIndex).Take(MAXIMUM_ROWS).ToList();

                foreach (var obj in list)
                {
                    movielist.Add(new MovieModel() { Id = obj.Id, Actors = obj.Actors, Award = obj.Award, Director = obj.Director, Festival = obj.FestivalFullName, Name = obj.Title, ReleasingDate = obj.Released, PosterUrl = obj.PosterLink, RunningTime = obj.Runtime });
                }
            }
            return movielist;
        }

        /// <summary>
        /// Search the movies list by search criteria provided by the user.
        /// </summary>
        /// <param name="requestModel">searchModel</param>
        /// <param name="incrementIndex">incrementIndex</param>
        /// <returns></returns>
        public List<MovieDetailsModel> GetMoviesBySearchCriteria(SearchModel requestModel, int incrementIndex)
        {
            //Empty bytes array
            byte[] emptyByte = { };
            List<MovieDetailsModel> movieslist = new List<MovieDetailsModel>();
            using (var repo = new filmfestivaldbEntities())
            {
                var list = repo.moviesdetails.Where(x => (requestModel.Actor == null || x.Actors.Contains(requestModel.Actor))
                                                       && (requestModel.Award == null || x.Award.Equals(requestModel.Award))
                                                       && (requestModel.Director == null || x.Director.Contains(requestModel.Director))
                                                       && (requestModel.Festival == null || x.FestivalFullName.Equals(requestModel.Festival))
                                                       && (requestModel.FilmTitle == null || x.Title.Equals(requestModel.FilmTitle))
                                                       && (requestModel.Genre == null || x.Genre.Contains(requestModel.Genre))
                                                       && (requestModel.Year == null || x.AwardYear.Equals(requestModel.Year))
                                                       && (x.YoutubeEmbeddedCode != emptyByte)
                                                       && (x.PosterLink != "")
                                                       && (x.DisplayFilm == true)
                                                       ).ToList();

                list = list.GroupBy(g => g.Title)
                           .Select(s => s.FirstOrDefault())
                           .OrderBy(z => z.Id)
                           .Skip(incrementIndex * MAXIMUM_ROWS).Take(MAXIMUM_ROWS).ToList();
               

                foreach (var obj in list)
                {
                    movieslist.Add(new MovieDetailsModel()
                                                       {
                                                           About = Encoding.Default.GetString(obj.Description),
                                                           Actors = obj.Actors,
                                                           Award = obj.Award,
                                                           Director = obj.Director,
                                                           Festival = obj.FestivalFullName,
                                                           Id = obj.Id,
                                                           Location = obj.Country,
                                                           Name = obj.Title,
                                                           PosterUrl = obj.PosterLink,
                                                           ReleasingDate = obj.Released,
                                                           RunningTime = obj.Runtime
                                                       });
                }
            }
            return movieslist;
        }

        /// <summary>
        /// Get current year movies
        /// </summary>
        /// <param name="incrementIndex"></param>
        /// <returns></returns>
        public List<MovieDetailsModel> GetAllMoviesCurrentYear(int incrementIndex)
        {
            byte[] emptyBytes = { };
            List<MovieDetailsModel> movieslist = new List<MovieDetailsModel>();
            using (var repo = new filmfestivaldbEntities())
            {
                var list = repo.moviesdetails.Where(x => x.AwardYear == "2015"
                                                      && x.PosterLink != ""
                                                      && x.YoutubeEmbeddedCode != emptyBytes
                                                      && x.DisplayFilm == true)
                                                      .ToList();

                list  = list.GroupBy(g => g.Title)
                            .Select(s => s.FirstOrDefault())
                            .OrderBy(z => z.Id)
                            .Skip(incrementIndex * MAXIMUM_ROWS).Take(MAXIMUM_ROWS).ToList();


                foreach (var obj in list)
                {
                    movieslist.Add(new MovieDetailsModel()
                                                       {
                                                           About = Encoding.Default.GetString(obj.Description),
                                                           Actors = obj.Actors,
                                                           Award = obj.Award,
                                                           Director = obj.Director,
                                                           Festival = obj.FestivalFullName,
                                                           Id = obj.Id,
                                                           Location = obj.Country,
                                                           Name = obj.Title,
                                                           PosterUrl = obj.PosterLink,
                                                           ReleasingDate = obj.Released,
                                                           RunningTime = obj.Runtime
                                                       });
                }
                return movieslist;
            }

        }

        /// <summary>
        /// Get highlighted movies from database
        /// </summary>
        /// <returns></returns>
        public List<HighlightMovieModel> GetHighlightMovies()
        {
            List<HighlightMovieModel> highlightedMovieDetails = new List<HighlightMovieModel>();
            using (var repo = new filmfestivaldbEntities())
            {
                var list = repo.moviesdetails.Where(x => x.HighlightFilm == true && x.PosterLink != "").ToList();
                foreach (var obj in list)
                {
                    highlightedMovieDetails.Add(new HighlightMovieModel() { MoviePosterUrl = obj.PosterLink, Id = obj.Id });
                }
                return highlightedMovieDetails;
            }
        }

    }
}