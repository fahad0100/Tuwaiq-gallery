import '../../../integration/supabase/supabase_integration.dart';
import '../../../models/users/user_details.dart';

Future<UserDetails> getProfileUserDataBase({required String id}) async {
  try {
    final userProfile = await SupabaseIntegration.supabase
        ?.from('users')
        .select("*,user_account(*)")
        .eq("id", id)
        .single();

    final project = await SupabaseIntegration.supabase
        ?.from('projects')
        .select(
            "*,images_project(*),links_project(*),members_project(*,users(*,user_account(*)))")
        .or('user_id.eq.$id,admin_id.eq.$id');
    userProfile?["projects"] = project;
    print(userProfile);
    return UserDetails.fromJson(userProfile!);
  } catch (error) {
    throw FormatException(error.toString());
  }
}
