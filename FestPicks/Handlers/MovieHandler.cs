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
        public MovieDetailsModel GetMovieDetailsById(int id)
        {
            MovieDetailsModel completeMovieDetails = null;
            using (var repo = new filmfestivaldbEntities())
            {
                var movieDetails = repo.moviesdetails.Where(x => x.Id == id).FirstOrDefault();
                if (movieDetails != null)
                {
                    completeMovieDetails = new MovieDetailsModel();
                    // Convert the bytes array into string and store into about 
                    completeMovieDetails.About = System.Text.Encoding.Default.GetString(movieDetails.Description);
                    completeMovieDetails.Actors = movieDetails.Actors;
                    completeMovieDetails.Award = movieDetails.Award;
                    completeMovieDetails.Director = movieDetails.Director;
                    completeMovieDetails.Festival = movieDetails.FestivalFullName;
                    completeMovieDetails.Id = movieDetails.Id;
                    completeMovieDetails.Location = movieDetails.Country;
                    completeMovieDetails.Name = movieDetails.Title;
                    completeMovieDetails.PosterUrl = movieDetails.PosterLink;
                    completeMovieDetails.ReleasingDate = movieDetails.Released;
                    completeMovieDetails.RunningTime = movieDetails.Runtime;
                    completeMovieDetails.MovieLink = movieDetails.MovieLink;
                    // Convert the bytes array into string and store into YoutubeEmbedded Link url
                    completeMovieDetails.YoutubeEmbeddedLink = System.Text.Encoding.Default.GetString(movieDetails.YoutubeEmbeddedCode);
                }
                return completeMovieDetails;
            }
        }

        /// <summary>
        /// Get the award winner movies of previous year by festival name
        /// </summary>
        /// <param name="festivalname"></param>
        /// <returns></returns>
        public List<MovieModel> GetAllMoviesByFestivalName(string festivalname,int incrementIndex)
        {
            List<MovieModel> movielist = new List<MovieModel>();
            byte[] empty = {};
            using (var repo = new filmfestivaldbEntities())
            {
                var moviedetails = repo.moviesdetails.Where(x => x.FestivalFullName == festivalname 
                                                            && x.Title != "" 
                                                            && x.PosterLink != "" 
                                                            && x.YoutubeEmbeddedCode != empty 
                                                            ).OrderBy(z => z.Id).Skip(MAXIMUM_ROWS*incrementIndex).Take(MAXIMUM_ROWS).ToList();
                foreach (var obj in moviedetails)
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
            byte[] emptyByte = {};
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
                                                       ).OrderBy(z => z.Id)
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

    }
}