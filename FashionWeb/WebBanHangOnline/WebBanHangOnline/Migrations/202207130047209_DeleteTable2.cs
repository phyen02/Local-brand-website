namespace WebBanHangOnline.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DeleteTable2 : DbMigration
    {
        public override void Up()
        {
            DropTable("dbo.tb_Email");
        }
        
        public override void Down()
        {
           
            CreateTable(
                "dbo.tb_Email",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Email = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.Id);
            
        }
    }
}
