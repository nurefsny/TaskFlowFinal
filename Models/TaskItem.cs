using System.ComponentModel.DataAnnotations;

namespace TaskFlow.Models
{
    public class TaskItem
    {
        [Key] 
        public int Id { get; set; }

        [Required(ErrorMessage = "Görev başlığı boş bırakılamaz.")]
        public string Title { get; set; }

        public string Description { get; set; }

        public bool IsCompleted { get; set; } = false;

        public DateTime CreatedDate { get; set; } = DateTime.Now;
    }
}