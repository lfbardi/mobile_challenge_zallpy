using System;
using System.Collections.Generic;
using Quiz.Domain.Entities;

namespace Quiz.Domain.Repositories
{
    public interface IQuestionRepository
    {
        void Create(Question question);

        Question GetById(Guid id);

        IEnumerable<Question> GetAll();
    }
}