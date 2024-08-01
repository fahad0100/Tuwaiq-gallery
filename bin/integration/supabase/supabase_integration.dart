import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';

class SupabaseIntegration {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  static SupabaseClient? supabase;
  Future<void> supabaseInit() async {
    supabase = SupabaseClient(
        env['supabaseURL'].toString(), env['serviceRoleSecret'].toString(),
        authOptions: AuthClientOptions(authFlowType: AuthFlowType.implicit));
  }
}
