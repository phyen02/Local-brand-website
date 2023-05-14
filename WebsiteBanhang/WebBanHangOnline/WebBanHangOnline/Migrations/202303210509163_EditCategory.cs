namespace WebBanHangOnline.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class EditCategory : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tb_Category", "TypeCode", c => c.String(maxLength: 150));
            AddColumn("dbo.tb_Category", "Link", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.tb_Category", "Link");
            DropColumn("dbo.tb_Category", "TypeCode");
        }
    }
}
