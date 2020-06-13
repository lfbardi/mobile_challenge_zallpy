using System;
using System.Linq.Expressions;
using Quiz.Domain.Entities;

namespace Quiz.Domain.Queries
{
    public static class QuestionQueries
    {
        public static Expression<Func<Question, bool>> GetAll()
        {
            return question => question.Id != null && question.CorrectAnswer != null;
        }

    }
}