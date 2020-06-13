using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Quiz.Domain.Entities;
using Quiz.Domain.Infra.Contexts;
using Quiz.Domain.Queries;
using Quiz.Domain.Repositories;

namespace Quiz.Domain.Infra.Repositories
{
    public class QuestionRepository : IQuestionRepository
    {

        private readonly DataContext _context;

        public QuestionRepository(DataContext context)
        {
            _context = context;
        }

        public void Create(Question question)
        {
            _context.Questions.Add(question);
            _context.SaveChanges();
        }

        public IEnumerable<Question> GetAll()
        {
            return _context.Questions
                .AsNoTracking()
                .Where(QuestionQueries.GetAll());
        }

        public Question GetById(Guid id)
        {
            return _context.Questions
            .FirstOrDefault(question => question.Id == id && id != null);
        }
    }
}