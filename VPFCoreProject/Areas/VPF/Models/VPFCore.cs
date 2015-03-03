using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.ComponentModel.DataAnnotations.Schema;

namespace VPFCoreProject.Areas.VPF.Models
{
    public partial class VPFCore
    {
        [Required]
        public int CoreId { get; set; }
        [Required]
        public string Data { get; set; }
        [Required]
        public string Privilege { get; set; }
        [Required, Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MenuID { get; set; }
        [Required]
        public int ParentMenuID { get; set; }
        [Required]
        public string ResourceKey { get; set; }
    }
    /// <summary>
    /// DbContext Visual Process Flow
    /// </summary>
    public partial class CoreVPFSQLEntities : DbContext
    {
        public virtual DbSet<VPFCore> VPFCores { get; set; }
       

    }


}