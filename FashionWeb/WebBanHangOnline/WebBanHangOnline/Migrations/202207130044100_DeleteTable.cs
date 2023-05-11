namespace WebBanHangOnline.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DeleteTable : DbMigration
    {
        public override void Up()
        {
            DropTable("tb_SettingSystem");
        }
        
        public override void Down()
        {
        }
    }
}
